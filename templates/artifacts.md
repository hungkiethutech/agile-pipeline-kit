# Artifact templates for the 7 stages (with Definition of Done)

Each team copies the matching section, fills it in, and writes it into its stage folder.
The "DoD" boxes must all be checked before handoff.

---

## 1. PRD — `specs/<id>-prd.md`
```markdown
# PRD — <id> <name>
## Goal & context
## Target users
## Scope (In scope / Out of scope)
## User Stories
- As a <role>, I want <what>, so that <benefit>.
## Acceptance Criteria (each must be testable)
- [ ] GIVEN <context> WHEN <action> THEN <expected result>
## Non-functional requirements
- Performance / Security / Devices / i18n...
## Open questions
```
DoD: every requirement has testable Given/When/Then; no blocking open questions; scope explicit.

---

## 2. Design Spec — `design/<id>-design-spec.md`
```markdown
# Design Spec — <id>
## Chosen aesthetic direction (+ 2 rejected, with rationale)
## Design Tokens
- Color / Typography / Spacing / Radius / Shadow
## Screens
### <Screen>: layout, components, states (default/loading/empty/error)
## Responsive
## Accessibility (contrast, focus, touch targets)
```
DoD: non-generic aesthetic; tokens present; each screen has states; responsive + a11y included.

---

## 3. Architecture — `arch/<id>-architecture.md` (+ schema, openapi.yaml, erd)
```markdown
# Architecture — <id>
## System overview (diagram)
## Data model (tables/models, relations, indexes)
## API contract (summary; details in openapi.yaml)
## ADR — architecture decisions & rationale
```
Plus: `arch/schema.(prisma|dbml|sql)`, `arch/openapi.yaml`, `arch/erd.(svg|md)`.
DoD: normalized schema + indexes + migration-ready; ERD exported; openapi complete (endpoints + error codes).

---

## 4. Dev Handoff — `app/HANDOFF.md`
```markdown
# HANDOFF — <id>
## How to run (setup, env vars [names only], dev/build commands)
## Folder structure
## Implemented API ↔ openapi.yaml mapping
## Screens ↔ design spec mapping
## Unit tests (how to run, what's covered)
## Blockers / contract mismatches (if any)
```
DoD: build/typecheck clean; matches openapi + design; unit tests for core logic; an outsider can run it.

---

## 5. Test Report — `qa/<id>-test-report.md` (+ bugs.md)
```markdown
# Test Report — <id>
## Test environment (app URL, device/browser)
## Results per Acceptance Criteria
- [ ] AC1: PASS/FAIL — note
## Edge cases tried (12 dimensions)
## Basic security checks
## Verdict: PASS / FAIL
```
`qa/<id>-bugs.md`: each bug = description + REPRODUCTION STEPS + expected vs actual + severity.
DoD: every AC exercised through the real UI; edge cases + security checked; bugs have repro.

---

## 6. Release Notes — `infra/<id>-release-notes.md`
```markdown
# Release Notes — <id>
## Version / date
## Changes
## Required environment variables (names only)
## Deploy steps (pipeline) + rollback path
```
DoD: reproducible pipeline; full env list (names); rollback documented.

---

## 7. Incident Log — `ops/<id>-incident-log.md`
```markdown
# Incident Log — <id>
## Monitoring (tool, URL, metrics tracked)
## Incidents
- Time | Description | Impact | Resolution | Ticket created
## Improvement proposals → new tickets
```
DoD: free uptime monitoring; metrics defined; incidents/improvements turned into new tickets (loop closed).
