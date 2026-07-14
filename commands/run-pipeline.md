---
description: Orchestrator — đẩy 1 ticket qua dây chuyền 7 đội độc lập, dừng ở cổng duyệt, cập nhật STATUS.html.
argument-hint: <ticket-id> [--from <stage>] [--to <stage>]
---

# /run-pipeline — Nhạc trưởng dây chuyền 7 đội

Bạn là ORCHESTRATOR. Bạn KHÔNG tự làm việc của các đội — bạn điều phối subagent, gác cổng
DoD, và cập nhật trạng thái. Ticket: `$ARGUMENTS`.

## Bước 0 — Chuẩn bị
1. Đọc `pipeline.config.yml` (project + engine mỗi bước + gates).
2. Đọc ticket `tickets/<id>.md`. Nếu không có, báo lỗi và dừng.
3. Xác định các bước cần chạy (mặc định 1→7; tôn trọng `--from/--to` nếu có).

## Bước 1..7 — Vòng lặp điều phối
Thứ tự: `requirements` → (`design` ∥ `architecture` song song) → `development` → `qa`
→ `devops` → `ops`.

Với mỗi bước:
1. Gọi subagent tương ứng (`ap-<stage>-agent`) qua Agent tool, TRUYỀN trong prompt:
   - ticket id, đường dẫn artifact bước trước (đầu vào), lựa chọn engine từ config.
   - Nhắc ràng buộc độc lập của bước (đặc biệt QA: chỉ specs + app đang chạy, KHÔNG đọc source).
2. Khi subagent xong: KIỂM DoD của artifact nó tạo (đọc checklist trong `templates/artifacts.md`).
   - Thiếu mục bắt buộc → trả về đúng đội đó chạy lại, KHÔNG cho qua bước sau.
3. Cập nhật `status/STATUS.html` (đánh dấu bước xong / đang chạy / chờ duyệt).

Song song bước 2 & 3: gọi cả hai subagent trong CÙNG một message (2 tool use) để chạy đồng thời.

## Cổng duyệt (theo `gates` trong config)
- `after: requirements` → sau bước 1, DỪNG: in tóm tắt PRD + đường dẫn, hỏi người dùng
  "duyệt yêu cầu?" — chờ "duyệt" mới chạy tiếp; "sửa lại: ..." → trả về BA.
- `before: devops` → trước bước 6, DỪNG: in kết quả QA, hỏi "duyệt deploy?" — chờ "duyệt".

## Khi QA (bước 5) KHÔNG ĐẠT
Trả ticket về đội Dev (bước 4) kèm `qa/<id>-bugs.md`; sau khi Dev sửa, chạy lại QA. Lặp tới khi đạt.

## Kết thúc
- Cập nhật ticket trạng thái DONE.
- In bản tóm tắt: mỗi bước → artifact + DoD pass/fail.
- Nhắc mở `status/STATUS.html` để xem trực quan.

## Nguyên tắc
- Không bỏ qua cổng DoD. Không tự viết artifact thay đội. Giữ tính độc lập giữa các đội.
