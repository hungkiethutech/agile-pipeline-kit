#!/usr/bin/env bash
# Agile Pipeline Kit — one-command scaffolder for a project.
# Usage:  bash /path/to/agile-pipeline-kit/init.sh [project-dir]
# No argument => scaffold into the current directory.
set -e

KIT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-$(pwd)}"

mkdir -p "$TARGET"/{specs,design,arch,app,qa,infra,ops,tickets,status,.claude/agents,.claude/commands}

cp "$KIT_DIR"/agents/*.md              "$TARGET"/.claude/agents/
cp "$KIT_DIR"/commands/run-pipeline.md "$TARGET"/.claude/commands/
cp "$KIT_DIR"/pipeline.config.yml      "$TARGET"/
cp -r "$KIT_DIR"/catalog               "$TARGET"/
cp -r "$KIT_DIR"/templates             "$TARGET"/
cp "$KIT_DIR"/status/STATUS.template.html "$TARGET"/status/STATUS.html

# Sample ticket (only if none exists)
if [ ! -e "$TARGET/tickets/T001.md" ]; then
  cat > "$TARGET/tickets/T001.md" <<'EOF'
# T001 - <feature name>
## Description
<describe the requirement in plain words>
## Constraints
## Status: NEW
EOF
fi

echo "✅ Scaffolded Agile Pipeline into: $TARGET"
echo "Next:"
echo "  1) Edit  $TARGET/pipeline.config.yml   (stack, DB, engine per stage)"
echo "  2) Edit  $TARGET/tickets/T001.md        (the requirement)"
echo "  3) Open Claude Code in the project and run:  /run-pipeline T001"
