# Áp dụng Agile Pipeline Kit vào một DỰ ÁN MỚI

Toàn bộ chạy trong Claude Code, free (subscription). Làm 1 lần cho mỗi dự án mới.

## Bước A — Tạo dự án mới + cấu trúc thư mục
```bash
mkdir my-new-project && cd my-new-project
git init
mkdir -p specs design arch app qa infra ops tickets status .claude/agents .claude/commands
```

## Bước B — Copy kit vào dự án
Từ thư mục `agile-pipeline-kit/` của kit:
```bash
cp agile-pipeline-kit/agents/*.md            my-new-project/.claude/agents/
cp agile-pipeline-kit/commands/run-pipeline.md my-new-project/.claude/commands/
cp agile-pipeline-kit/pipeline.config.yml    my-new-project/
cp -r agile-pipeline-kit/catalog             my-new-project/
cp -r agile-pipeline-kit/templates           my-new-project/
cp agile-pipeline-kit/status/STATUS.template.html my-new-project/status/STATUS.html
```
(Cách nhanh hơn: dùng skill `vc-setup` để scaffold — xem Bước F.)

## Bước C — Cấu hình engine cho dự án
Mở `pipeline.config.yml`, sửa:
- `project.name`, `project.stack`, `project.db`
- `stages.*.skill` / `stages.*.repo` — chọn engine mong muốn cho từng bước
  (tham khảo `catalog/engines.md`).

## Bước D — Tạo ticket đầu tiên
Tạo file `tickets/T001.md`:
```markdown
# T001 - <tên tính năng>
## Mô tả
<mô tả yêu cầu bằng lời>
## Ràng buộc
<nếu có>
## Trạng thái: NEW   (NEW -> stage1..stage7 -> DONE)
```

## Bước E — Chạy dây chuyền (trong Claude Code)
Mở Claude Code tại thư mục dự án, gõ:
```
/run-pipeline T001
```
Orchestrator sẽ:
1. Đọc `pipeline.config.yml` + ticket.
2. Chạy lần lượt 7 đội (bước 2 & 3 song song), mỗi đội ghi artifact vào thư mục của nó.
3. DỪNG ở 2 cổng duyệt: sau bước 1 (chốt yêu cầu) và trước bước 6 (chốt deploy) —
   anh xem artifact, gõ "duyệt" để đi tiếp, hoặc "sửa lại: ..." để trả về đội đó.
4. Cập nhật `status/STATUS.html` sau mỗi bước.

Mở `status/STATUS.html` bằng trình duyệt để theo dõi.

## Bước F — (Tùy chọn) biến kit thành scaffold tái dùng
Đăng ký kit vào skill `vc-setup` để lần sau chỉ cần 1 lệnh scaffold toàn bộ cấu trúc +
agent + config vào dự án mới, thay cho copy tay ở Bước B. (Phase tiếp theo sẽ móc nối.)

## Ghi chú độc lập (quan trọng)
- Mỗi đội là subagent context riêng — không thấy nội bộ đội khác.
- Đội QA (bước 5) KHÔNG đọc thư mục `app/` theo kiểu diễn giải source; nó chạy app + đọc
  `specs/` (acceptance criteria) và test như người dùng thật.
- Đội Dev (bước 4) code theo `arch/schema.*` + `arch/openapi.yaml`, không tự bịa.
