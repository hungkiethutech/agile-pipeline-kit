#!/usr/bin/env bash
# Agile Pipeline Kit — one-command scaffolder for a project.
# Usage:  bash /path/to/agile-pipeline-kit/init.sh [project-dir]
# No argument => scaffold into the current directory.
set -e

KIT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-$(pwd)}"

mkdir -p "$TARGET"/{specs,design,arch,app,qa,security,infra,ops,tickets,status,context/adr,.claude/agents,.claude/commands}

cp "$KIT_DIR"/agents/*.md              "$TARGET"/.claude/agents/
cp "$KIT_DIR"/commands/run-pipeline.md "$TARGET"/.claude/commands/
cp "$KIT_DIR"/pipeline.config.yml      "$TARGET"/
cp -r "$KIT_DIR"/catalog               "$TARGET"/
cp -r "$KIT_DIR"/templates             "$TARGET"/
cp "$KIT_DIR"/status/STATUS.template.html "$TARGET"/status/STATUS.html

# Seed the persistent context layer (project long-term memory) from templates.
# Agents read context/ first every ticket; the Architecture team keeps it current.
cp "$KIT_DIR"/templates/context/architecture.md "$TARGET"/context/
cp "$KIT_DIR"/templates/context/module-map.md   "$TARGET"/context/
cp "$KIT_DIR"/templates/context/adr/ADR-template.md "$TARGET"/context/adr/

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
