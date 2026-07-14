# Catalog Engine — skill/repo gợi ý cho từng bước

Mỗi bước có thể "cắm" 1 skill và/hoặc 1 repo GitHub. Skill nạp trực tiếp; repo
được hút phương pháp qua `vc-repomix` (đóng gói tham chiếu) hoặc `vc-xia` (nghiên cứu/đối chiếu).
Đổi lựa chọn trong `pipeline.config.yml`.

## Bước 1 — Yêu cầu (BA)
- Skill: `deep-research`, `vc-scenario` (edge case), `vc-predict` (soi rủi ro)
- Repo: `github/spec-kit` (spec-driven), awesome-product-management lists
- Mục tiêu: PRD + Acceptance Criteria (Given/When/Then), mọi yêu cầu test được.

## Bước 2 — Thiết kế UX/UI (chống "vibe code")
- Skill (engine chính, quyết định gu): `high-end-visual-design`, `design-taste-frontend`,
  `redesign-existing-projects`, `minimalist-ui`, `industrial-brutalist-ui`, `brandkit`, `gpt-taste`
- Repo (gạch xây có chất, KHÔNG quyết định gu): `framer/motion` (animation),
  `pmndrs/react-three-fiber` + `pmndrs/drei` (3D), `magicuidesign/magicui`, `aceternity/ui`
- Lưu ý: KHÔNG dùng component library (shadcn...) làm "engine đẹp" — chúng chỉ là primitive,
  dùng default sẽ ra giao diện generic. Đẹp/khác biệt đến từ taste skill + art direction.

## Bước 3 — Kiến trúc & DB
- Skill: `vc-tech-graph` (ERD/sơ đồ kiến trúc SVG), `vc-predict`, `vc-sequential-thinking`
- Repo: `prisma/prisma` (schema), `holistics/dbml` (ERD-as-code), `treffynnon/sqlstyle.guide`,
  `OAI/OpenAPI-Specification` (hợp đồng API)
- Mục tiêu: schema chuẩn hóa + ERD + openapi.yaml + tài liệu kiến trúc.

## Bước 4 — Lập trình (BE + FE)
- Skill: `vc-frontend-design`; (nâng cao, cắm sau) bộ skills "Superpowers" cho TDD/kỷ luật
- Repo: `goldbergyoni/nodebestpractices`, `airbnb/javascript`, boilerplate hợp stack
  (vd `ixartz/Next-js-Boilerplate`, `t3-oss/create-t3-app`)
- Mục tiêu: code theo schema+API contract bước 3, clean code, có test, tài liệu handoff.

## Bước 5 — Kiểm thử (QA độc lập, hộp đen)
- Skill: `vc-web-testing`, `vc-scenario`, `vc-security`, `vc-agent-browser`, `vc-chrome-devtools`
- Repo: `microsoft/playwright`, `goldbergyoni/javascript-testing-best-practices`
- Mục tiêu: test như người dùng thật theo acceptance criteria, KHÔNG đọc source; bug có repro.

## Bước 6 — Triển khai (DevOps)
- Skill: (thường không cần)
- Repo: `actions/starter-workflows` (CI template), `MichaelCade/90DaysOfDevOps`
- Mục tiêu: pipeline tái lập + deploy Vercel/Render (free) + release notes + rollback.

## Bước 7 — Vận hành (SRE)
- Skill: `vc-autoresearch` (tối ưu metric)
- Repo: `upptime/upptime` (monitoring free trên GitHub Actions), `dastergon/awesome-sre`
- Mục tiêu: monitoring chạy + log sự cố + ticket cải tiến quay về bước 1.

---
Ghi chú: độ nổi tiếng/tình trạng repo tính tới đầu 2026, có thể đổi. Toàn bộ cắm-rút được.
