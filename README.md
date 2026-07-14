# Agile Pipeline Kit (Free, chạy trong Claude Code)

Dây chuyền phát triển phần mềm Agile gồm **7 đội độc lập**, mỗi đội là một subagent
riêng (context cách ly, như thuê team ngoài). Chạy 100% trong Claude Code bằng gói
subscription — **không** dùng API trả phí, **không** cần server/CI trả phí.

## ⚡ Setup nhanh (1 lệnh)
```bash
# 1) Clone kit về máy (làm 1 lần duy nhất)
git clone git@github.com:hungkiethutech/agile-pipeline-kit.git ~/.agile-kit

# 2) Với mỗi dự án mới: scaffold toàn bộ khung chỉ bằng 1 lệnh
bash ~/.agile-kit/init.sh ~/duong-dan/du-an-moi
```
Script tự tạo cấu trúc thư mục + copy 7 agent, lệnh orchestrator, config, catalog,
template, STATUS.html và 1 ticket mẫu vào dự án. Sau đó chỉ cần sửa `pipeline.config.yml`,
sửa `tickets/T001.md`, rồi mở Claude Code gõ `/run-pipeline T001`.

(Cách thủ công từng bước: xem `APPLY.md`.)

## Triết lý
- **Độc lập như team ngoài:** mỗi bước = 1 subagent context riêng, chỉ nhận *artifact
  bàn giao* của bước trước (không thấy suy nghĩ nội bộ).
- **Bàn giao theo hợp đồng:** bước sau chỉ chạy khi artifact bước trước đạt
  "Definition of Done" (DoD).
- **QA hộp đen:** đội Test chỉ nhận app đang chạy + acceptance criteria, KHÔNG đọc
  source của Dev → tìm lỗi khách quan, như người dùng thật.
- **Dev code theo hợp đồng:** bám `schema` + `openapi.yaml` của đội Kiến trúc.

## 7 bước
| # | Bước | Thư mục | Subagent |
|---|---|---|---|
| 1 | Yêu cầu (BA) | `specs/` | `ap-ba-agent` |
| 2 | Thiết kế UX/UI | `design/` | `ap-design-agent` |
| 3 | Kiến trúc & DB | `arch/` | `ap-arch-agent` |
| 4 | Lập trình (BE+FE) | `app/` | `ap-dev-agent` |
| 5 | Kiểm thử (QA) | `qa/` | `ap-qa-agent` |
| 6 | Triển khai (DevOps) | `infra/` | `ap-devops-agent` |
| 7 | Vận hành (SRE) | `ops/` | `ap-ops-agent` |

Bước 2 và 3 chạy **song song** (cùng chỉ cần PRD bước 1), rồi cả hai đổ vào bước 4.

## Thành phần
```
init.sh                     <- scaffold 1 lệnh vào dự án mới
pipeline.config.yml         <- chọn engine (skill/repo) cho từng bước, mỗi lần chạy
catalog/engines.md          <- danh mục skill/repo gợi ý theo từng bước
agents/                     <- 7 định nghĩa subagent
templates/artifacts.md      <- template artifact 7 bước + checklist DoD
commands/run-pipeline.md    <- lệnh orchestrator
status/STATUS.template.html <- bảng Kanban theo dõi (mở bằng trình duyệt)
APPLY.md                    <- hướng dẫn thủ công
```

## Vận hành (tóm tắt)
1. `pipeline.config.yml`: chọn engine mỗi bước (xem `catalog/engines.md`).
2. Tạo ticket: file markdown trong `tickets/`.
3. Trong Claude Code gõ `/run-pipeline <ticket>`.
4. Orchestrator đẩy ticket qua 7 bước, dừng ở 2 cổng duyệt (chốt Yêu cầu, chốt trước Deploy).
5. Mở `status/STATUS.html` bằng trình duyệt để xem tiến trình.
