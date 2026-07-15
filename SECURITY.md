# Security Policy

## Scope
This project is a set of prompt/config templates and a shell scaffolder (`init.sh`)
for Claude Code. It ships **no runtime server** and stores **no secrets**. The main
security considerations are:
- `init.sh` runs shell commands locally to scaffold a project. Review it before running.
- Agent prompts drive Claude Code, which can read/write files and run commands in the
  project you point it at. Run it only on projects you trust.

## Reporting a Vulnerability
If you find a security issue (e.g. a way `init.sh` could write outside the target
directory, or a prompt that could exfiltrate data), please **do not open a public
issue**. Instead, report it privately:
- Use GitHub's **"Report a vulnerability"** (Security → Advisories) on this repo, or
- Contact the maintainer via the email on their GitHub profile.

Please include steps to reproduce and the impact. We aim to acknowledge reports within
a few days.

## Supported Versions
This project is at an early stage (v0.x). Only the latest `main` is supported.
