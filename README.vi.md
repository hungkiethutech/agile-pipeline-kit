# Agile Pipeline Kit (Tiếng Việt)

Dây chuyền phát triển phần mềm Agile gồm **8 đội độc lập**, mỗi đội là một subagent
riêng (context cách ly, như thuê team ngoài). Chạy 100% trong Claude Code bằng gói
subscription — **không** dùng API trả phí, **không** cần server/CI trả phí.

🇬🇧 English: [README.md](./README.md).

## ⚡ Setup nhanh (1 lệnh)
```bash
# 1) Clone kit về máy (làm 1 lần duy nhất)
git clone https://github.com/hungkiethutech/agile-pipeline-kit.git ~/.agile-kit

# 2) Với mỗi dự án mới: scaffold toàn bộ khung chỉ bằng 1 lệnh
bash ~/.agile-kit/init.sh ~/duong-dan/du-an-moi
```
Sau đó sửa `pipeline.config.yml`, sửa `tickets/T001.md`, mở Claude Code gõ `/run-pipeline T001`.
(Cách thủ công: xem `APPLY.md`.)

## Triết lý
- **Độc lập như team ngoài:** mỗi bước = 1 subagent context riêng, chỉ nhận artifact
  bàn giao của bước trước (không thấy suy nghĩ nội bộ).
- **Bàn giao theo hợp đồng:** bước sau chỉ chạy khi artifact bước trước đạt DoD.
- **QA hộp đen:** đội Test chỉ nhận app đang chạy + acceptance criteria, KHÔNG đọc
  source của Dev → tìm lỗi khách quan, như người dùng thật.
- **Dev code theo hợp đồng:** bám `schema` + `openapi.yaml` của đội Kiến trúc.

## 8 bước
| # | Bước | Thư mục | Subagent |
|---|---|---|---|
| 1 | Yêu cầu (BA) | `specs/` | `ap-ba-agent` |
| 2 | Thiết kế UX/UI | `design/` | `ap-design-agent` |
| 3 | Kiến trúc & DB | `arch/` | `ap-arch-agent` |
| 4 | Lập trình (BE+FE) | `app/` | `ap-dev-agent` |
| 5 | Kiểm thử (QA) | `qa/` | `ap-qa-agent` |
| 6 | Bảo mật / Pentest (OWASP Top 10:2025) | `security/` | `ap-security-agent` |
| 7 | Triển khai (DevOps) | `infra/` | `ap-devops-agent` |
| 8 | Vận hành (SRE) | `ops/` | `ap-ops-agent` |

Bước 2 và 3 chạy song song, rồi cả hai đổ vào bước 4.

## Giấy phép
[MIT](./LICENSE) © 2026 Dang Hung Kiet
