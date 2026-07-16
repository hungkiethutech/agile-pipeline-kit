---
description: Orchestrator — push a ticket through the 8 independent teams, pause at approval gates, update STATUS.html.
argument-hint: <ticket-id> [--from <stage>] [--to <stage>]
---

# /run-pipeline — orchestrator for the 8-team pipeline

You are the ORCHESTRATOR. You do NOT do the teams' work — you coordinate subagents,
enforce the DoD gates, and update status. Ticket: `$ARGUMENTS`.

## Step 0 — Prepare
1. Read `pipeline.config.yml` (project + engine per stage + gates + `context` + `arch_review`).
2. Read the ticket `tickets/<id>.md`. If missing, report an error and stop.
3. Determine the stages to run (default full flow; respect `--from/--to` if given).
4. **Context (persistent memory):** ensure `context/` exists (architecture.md, module-map.md, adr/).
   EVERY subagent prompt you build MUST tell the agent to read `context/*` FIRST — this is the
   project's long-term memory that keeps tickets coherent. From `context/module-map.md` note which
   modules this ticket touches (used to decide integration + how many modules are affected).

## Steps 1..7 — Coordination loop
Order: `requirements` → (`design` ∥ `architecture` in parallel) → `development` →
**`arch-review`** → `qa` → **`integration`** → `security` → `devops` → `ops`.
- `arch-review` (agent `ap-arch-review-agent`): coherence gate right after Dev — checks the change
  respects `context/` (invariants, module boundaries, contracts, ADRs). FAIL → back to Dev (or to
  Architecture if a contract/ADR must change first). This is the cheap early guard against drift.
- `integration` (agent `ap-integration-agent`): runs ONLY if the ticket touches **2+ modules**
  (from `context/module-map.md`). Tests the cross-module seams. FAIL → back to Dev.
- Security (OWASP Top 10 pentest) runs after functional + integration QA and blocks deploy on any
  High/Critical finding.

For each stage:
1. Invoke the matching subagent (`ap-<stage>-agent`) via the Agent tool, passing in the prompt:
   - the ticket id, the path to the prior stage's artifact (its input), the engine choice from config.
   - a reminder of the stage's independence rule (especially QA: only specs + running app, NOT source).
2. When the subagent finishes: CHECK the DoD of the artifact it produced (read the checklist
   in `templates/artifacts.md`).
   - Missing a required item → send it back to that same team, do NOT advance.
3. Update `status/STATUS.html` (mark stage done / running / waiting-approval).

Parallel stages 2 & 3: invoke both subagents in the SAME message (2 tool uses) to run concurrently.

## Approval gates (per `gates` in config)
- `after: requirements` → after stage 1, PAUSE: print a PRD summary + path, ask the user
  "approve requirements?" — wait for "approve" before continuing; "revise: ..." → back to BA.
- `before: devops` → before stage 6, PAUSE: print QA results, ask "approve deploy?" — wait for "approve".

## When QA (stage 5) FAILS
Send the ticket back to Dev (stage 4) with `qa/<id>-bugs.md`; after Dev fixes, re-run QA. Loop until it passes.

## Finish
- **Update persistent memory:** invoke the Architecture team once more to update `context/`
  from what shipped — append/adjust `module-map.md` (new/changed contracts, dependency edges) and
  write an ADR in `context/adr/` for any significant decision. This is what lets ticket #50 respect
  ticket #1. Do NOT skip — stale context is how a many-module project drifts.
- Update the ticket status to DONE.
- Print a summary: each stage → artifact + DoD pass/fail.
- Remind the user to open `status/STATUS.html` for the visual board.

## Principles
- Never skip a DoD gate. Never write an artifact on a team's behalf. Keep teams independent.
