# Architecture (living document)

> **This is the project's long-term memory.** EVERY agent MUST read this before working.
> The Architecture team (stage 3) MUST update it at the end of every ticket that changes
> structure. Keep it short and current — it is context, not documentation for humans.

## System overview
_One paragraph: what the system is, the main runtime pieces (e.g. web / api / db / workers)._

## Global invariants (never break without an ADR)
- _e.g. All money stored as integer minor units._
- _e.g. All timestamps stored UTC; converted at the edge._
- _e.g. Auth = JWT access (15m) + refresh cookie (7d)._

## Shared contracts (used across modules)
- **Shared types:** _where they live, e.g. `packages/shared/types`._
- **Shared entities:** _e.g. `User` is referenced by attendance, leave, payroll — changing it is cross-module._
- **API response shape / error shape:** _the one true shape._

## Cross-cutting concerns
_Logging, auth, i18n, feature flags, config — where each is handled so modules don't re-invent._

## Glossary (domain terms)
| Term | Meaning |
|---|---|
| _CTV_ | _collaborator / contractor_ |

## Decisions
See `context/adr/` — each significant/architectural decision is one ADR file. Read the
index below before proposing anything that conflicts.

| ADR | Title | Status |
|---|---|---|
| ADR-0001 | _example_ | Accepted |
