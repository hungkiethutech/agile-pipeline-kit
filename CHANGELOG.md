# Changelog

All notable changes to this project are documented here. This project adheres to
[Semantic Versioning](https://semver.org/).

## [0.3.0] - 2026-07-16
### Added — scaling to complex, many-module projects
- **Persistent context layer** (`context/`): `architecture.md`, `module-map.md`, `adr/` — the
  project's long-term memory that every agent reads first; the Architecture team keeps it current
  after each ticket. Fixes cross-ticket memory loss.
- **Integration stage** (`ap-integration-agent`, 5b): auto-runs when a ticket touches 2+ modules;
  tests the cross-module seams (data consistency, transactions, contract-drift). Fixes cross-module drift.
- **Architectural oversight gate** (`ap-arch-review-agent`): runs after Dev; blocks module-boundary
  violations and undocumented shared-contract changes (requires an ADR). Fixes coherence drift.
### Changed
- Orchestrator flow: `… → dev → arch-review → qa → integration → security → … → arch updates context`.
- `pipeline.config.yml` gains `context`, `arch_review`, and an `integration` stage; `init.sh` seeds `context/`.
- See `docs/v0.3-scaling-to-complex-projects.md`.

## [0.2.0] - 2026-07-15
### Added
- Stage 6: independent **Security / Penetration Testing** team (OWASP Top 10 + WSTG),
  which blocks deploy on any High/Critical finding. The pipeline is now **8 stages**.

## [0.1.0] - 2026-07-15
### Added
- Initial release: free, Claude-Code-native Agile pipeline with **7 independent
  agent teams** (Requirements, UX/UI Design, Architecture & DB, Development,
  black-box QA, DevOps, Operations).
- Contract-based handoff with a Definition of Done (DoD) per stage.
- Black-box QA agent that tests the running app as a real end user.
- Pluggable engines per stage (skills and popular GitHub repos) via
  `pipeline.config.yml` and `catalog/engines.md`.
- `init.sh` one-command scaffolder for new projects.
- `/run-pipeline` orchestrator command and `STATUS.html` Kanban board.
- Open-source project files: MIT LICENSE, English + Vietnamese README,
  CONTRIBUTING, CODE_OF_CONDUCT, SECURITY policy, issue/PR templates.
- All docs, agent prompts, and templates in English (Vietnamese README kept as README.vi.md).
