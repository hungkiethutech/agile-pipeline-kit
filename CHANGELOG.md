# Changelog

All notable changes to this project are documented here. This project adheres to
[Semantic Versioning](https://semver.org/).

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
