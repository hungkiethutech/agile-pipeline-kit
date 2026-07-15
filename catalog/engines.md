# Engine Catalog — suggested skills/repos per stage

Each stage can plug in a skill and/or a GitHub repo. Skills load directly; repos are
pulled as reference via `vc-repomix` (pack a reference artifact) or `vc-xia` (study/adapt).
Change your choices in `pipeline.config.yml`.

## Stage 1 — Requirements (BA)
- Skill: `deep-research`, `vc-scenario` (edge cases), `vc-predict` (risk review)
- Repo: `github/spec-kit` (spec-driven), awesome-product-management lists
- Goal: PRD + Acceptance Criteria (Given/When/Then), every requirement testable.

## Stage 2 — UX/UI Design (anti "AI slop")
- Skill (primary engine, decides taste): `high-end-visual-design`, `design-taste-frontend`,
  `redesign-existing-projects`, `minimalist-ui`, `industrial-brutalist-ui`, `brandkit`, `gpt-taste`
- Repo (building blocks with character, NOT taste): `framer/motion` (animation),
  `pmndrs/react-three-fiber` + `pmndrs/drei` (3D), `magicuidesign/magicui`, `aceternity/ui`
- Note: do NOT use a component library (shadcn...) as the "beauty engine" — those are just
  primitives; using defaults yields generic UI. Distinctiveness comes from taste skills + art direction.

## Stage 3 — Architecture & DB
- Skill: `vc-tech-graph` (ERD/architecture SVG), `vc-predict`, `vc-sequential-thinking`
- Repo: `prisma/prisma` (schema), `holistics/dbml` (ERD-as-code), `treffynnon/sqlstyle.guide`,
  `OAI/OpenAPI-Specification` (API contract)
- Goal: normalized schema + ERD + openapi.yaml + architecture doc.

## Stage 4 — Development (BE + FE)
- Skill: `vc-frontend-design`; (advanced, plug in later) the "Superpowers" skill set for TDD/discipline
- Repo: `goldbergyoni/nodebestpractices`, `airbnb/javascript`, a stack boilerplate
  (e.g. `ixartz/Next-js-Boilerplate`, `t3-oss/create-t3-app`)
- Goal: build to stage-3 schema+API contract, clean code, tests, handoff docs.

## Stage 5 — QA (independent, black-box)
- Skill: `vc-web-testing`, `vc-scenario`, `vc-security`, `vc-agent-browser`, `vc-chrome-devtools`
- Repo: `microsoft/playwright`, `goldbergyoni/javascript-testing-best-practices`
- Goal: test like a real user against acceptance criteria, WITHOUT reading source; bugs with repro.

## Stage 6 — Deployment (DevOps)
- Skill: (usually none)
- Repo: `actions/starter-workflows` (CI templates), `MichaelCade/90DaysOfDevOps`
- Goal: reproducible pipeline + deploy to Vercel/Render (free) + release notes + rollback.

## Stage 7 — Operations (SRE)
- Skill: `vc-autoresearch` (metric optimization)
- Repo: `upptime/upptime` (free monitoring on GitHub Actions), `dastergon/awesome-sre`
- Goal: monitoring live + incident log + improvement tickets back to stage 1.

---
Note: repo popularity/status is as of early 2026 and may change. Everything is pluggable.
