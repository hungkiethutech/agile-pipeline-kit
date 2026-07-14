# Contributing to Agile Pipeline Kit

Thanks for your interest in improving this project! Contributions of all kinds are
welcome — bug reports, docs, new stage engines, and translations.

## Ways to contribute
- **Translate internals to English.** Agent prompts (`agents/*.md`), templates, and
  the catalog are currently in Vietnamese. Help translating them is especially
  valuable for international adoption.
- **Add engines.** Propose new skills or popular GitHub repos for any stage in
  `catalog/engines.md`.
- **Improve agent prompts** so each "team" produces stronger, more independent output.
- **Docs & examples.** Add worked examples or clarify setup.

## How to contribute
1. Fork the repo and create a branch: `git checkout -b feat/your-change`.
2. Make your change. Keep it focused and small.
3. If you touch an agent, keep its independence rules intact (especially the
   black-box QA constraint — QA must not read the dev's source).
4. Open a Pull Request describing what and why.

## Ground rules
- Keep the kit **free and Claude-Code-native** — no dependency that requires paid API
  or a hosted server to run the pipeline.
- Preserve the contract-based handoff and Definition of Done (DoD) model.
- Be kind. See [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

## Reporting issues
Open a GitHub Issue with clear reproduction steps (for bugs) or a concrete proposal
(for features). Screenshots and example tickets help.
