# Example walkthrough — a URL shortener

> **Illustrative sample.** This shows the *shape* of the artifacts each of the 8 teams
> hands off for one ticket. It's documentation, not a captured live run — run your own
> with `/run-pipeline T001`. Content is abbreviated for readability.

**Ticket `T001`:** "Let users shorten a long URL and get a short link; visiting the short
link redirects to the original. Anonymous, rate-limited."

---

## Stage 1 — Requirements (BA) → `specs/T001-prd.md`
User stories + testable Acceptance Criteria:
- **AC1** — GIVEN a valid URL WHEN I submit it THEN I receive a unique short code.
- **AC2** — GIVEN a short code WHEN I visit `/{code}` THEN I'm redirected (301) to the original URL.
- **AC3** — GIVEN an invalid URL WHEN I submit it THEN I get a validation error.
- **AC4** — Rate limit: max 20 creates/min per IP.
- Non-functional: p95 redirect < 100ms; no auth.

## Stage 2 — UX/UI Design → `design/T001-design-spec.md`
Direction: minimalist, single-column, large input. Tokens: accent `#4F46E5`, radius 12px,
DM Sans. Screens: Home (input + "Shorten"), Result (copyable short link, states:
default/loading/error/success). WCAG AA contrast; touch targets ≥ 44px.

## Stage 3 — Architecture & DB → `arch/` (schema + openapi.yaml + ERD)
```
model Link { id String @id @default(cuid())
             code String @unique   // short code
             url  String
             hits Int @default(0)
             createdAt DateTime @default(now())
             @@index([code]) }
```
API (OpenAPI 3.x): `POST /api/links {url} → 201 {code, shortUrl}` · `GET /{code} → 301`.
ADR: base62 code from an incrementing id; 301 permanent redirect + async hit counter.

## Stage 4 — Development → `app/` + `app/HANDOFF.md`
Backend implements the OpenAPI contract; frontend implements the design spec + tokens.
Unit tests for code generation + validation. `HANDOFF.md` documents run steps + env vars.

## Stage 5 — QA (black-box) → `qa/T001-test-report.md`
Tested through the real UI as a user: AC1 ✅, AC2 ✅, AC3 ✅, AC4 ✅. Edge cases: 2000-char
URL, unicode, duplicate submit, missing scheme. 1 bug filed (missing-scheme URL 500s) with
repro → sent back to Dev → fixed → re-tested ✅.

## Stage 6 — Security / Pentest (OWASP Top 10:2025) → `security/T001-pentest-report.md`
Reviewed all 10 categories. Findings: **A01** open-redirect via `javascript:` scheme
(Medium — remediation: allowlist http/https) → fixed; **A05** missing security headers
(Low). No High/Critical. Verdict: PASS after fix.

## Stage 7 — Deployment → `infra/T001-release-notes.md`
CI: build → test → deploy. Frontend on Vercel, backend on Render (free). Env: `DATABASE_URL`,
`RATE_LIMIT`. Rollback: redeploy previous git tag.

## Stage 8 — Operations (SRE) → `ops/T001-incident-log.md`
Uptime monitoring via `upptime` (GitHub Actions). SLO: 99.5% uptime, p95 < 100ms. One idea
logged ("custom aliases") → new ticket `T002` back to stage 1.
