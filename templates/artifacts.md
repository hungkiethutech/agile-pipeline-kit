# Template Artifact 7 bước (kèm Definition of Done)

Mỗi đội copy mục tương ứng, điền nội dung, ghi vào thư mục của bước. Phần "DoD" phải tick
đủ trước khi bàn giao.

---

## 1. PRD — `specs/<id>-prd.md`
```markdown
# PRD — <id> <tên>
## Mục tiêu & bối cảnh
## Đối tượng người dùng
## Phạm vi (In scope / Out of scope)
## User Stories
- Là <vai trò>, tôi muốn <gì>, để <lợi ích>.
## Acceptance Criteria (mỗi mục test được)
- [ ] GIVEN <bối cảnh> WHEN <hành động> THEN <kết quả kỳ vọng>
## Yêu cầu phi chức năng
- Hiệu năng / Bảo mật / Thiết bị / Ngôn ngữ...
## Câu hỏi mở
```
DoD: mọi yêu cầu có Given/When/Then test được; không còn câu hỏi mở chặn; phạm vi rõ.

---

## 2. Design Spec — `design/<id>-design-spec.md`
```markdown
# Design Spec — <id>
## Hướng thẩm mỹ đã chọn (và 2 hướng loại, kèm lý do)
## Design Tokens
- Màu / Typography / Spacing / Radius / Shadow
## Màn hình
### <Tên màn>: layout, component, trạng thái (default/loading/empty/error)
## Responsive
## Accessibility (tương phản, focus, kích thước chạm)
```
DoD: hướng thẩm mỹ không generic; có tokens; mỗi màn có trạng thái; có responsive + a11y.

---

## 3. Architecture — `arch/<id>-architecture.md` (+ schema, openapi.yaml, erd)
```markdown
# Architecture — <id>
## Tổng quan hệ thống (sơ đồ)
## Mô hình dữ liệu (bảng/model, quan hệ, index)
## Hợp đồng API (tóm tắt; chi tiết ở openapi.yaml)
## ADR — Quyết định kiến trúc & lý do
```
Kèm: `arch/schema.(prisma|dbml|sql)`, `arch/openapi.yaml`, `arch/erd.(svg|md)`.
DoD: schema chuẩn hóa + index + migration-ready; ERD xuất được; openapi đủ endpoint + mã lỗi.

---

## 4. Dev Handoff — `app/HANDOFF.md`
```markdown
# HANDOFF — <id>
## Cách chạy (cài đặt, biến môi trường [chỉ tên], lệnh dev/build)
## Cấu trúc thư mục
## Ánh xạ API đã hiện thực ↔ openapi.yaml
## Ánh xạ màn hình ↔ design spec
## Test đơn vị (chạy sao, phủ gì)
## Vướng mắc / lệch hợp đồng (nếu có)
```
DoD: build/typecheck sạch; khớp openapi + design; có test logic chính; người ngoài chạy được.

---

## 5. Test Report — `qa/<id>-test-report.md` (+ bugs.md)
```markdown
# Test Report — <id>
## Môi trường test (URL app, thiết bị/trình duyệt)
## Kết quả theo Acceptance Criteria
- [ ] AC1: PASS/FAIL — ghi chú
## Edge case đã thử (12 chiều)
## Kiểm bảo mật cơ bản
## Kết luận: ĐẠT / KHÔNG ĐẠT
```
`qa/<id>-bugs.md`: mỗi bug = mô tả + BƯỚC TÁI HIỆN + kỳ vọng vs thực tế + mức độ.
DoD: mọi AC bấm thử qua UI thật; có edge case + bảo mật; bug có repro.

---

## 6. Release Notes — `infra/<id>-release-notes.md`
```markdown
# Release Notes — <id>
## Phiên bản / ngày
## Thay đổi
## Biến môi trường cần thiết (chỉ tên)
## Cách deploy (pipeline) + đường rollback
```
DoD: pipeline tái lập; env đầy đủ (tên); có rollback.

---

## 7. Incident Log — `ops/<id>-incident-log.md`
```markdown
# Incident Log — <id>
## Giám sát (công cụ, URL, metric theo dõi)
## Sự cố
- Thời gian | Mô tả | Ảnh hưởng | Xử lý | Ticket sinh ra
## Đề xuất cải tiến → ticket mới
```
DoD: có giám sát uptime free; có metric; sự cố/cải tiến thành ticket mới (đóng vòng lặp).
