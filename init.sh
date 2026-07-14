#!/usr/bin/env bash
# Agile Pipeline Kit — scaffold nhanh vào 1 dự án (1 lệnh).
# Dùng:  bash /duong-dan/agile-pipeline-kit/init.sh [thu-muc-du-an]
# Không truyền tham số => scaffold vào thư mục hiện tại.
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

# Ticket mẫu (chỉ tạo nếu chưa có)
if [ ! -e "$TARGET/tickets/T001.md" ]; then
  cat > "$TARGET/tickets/T001.md" <<'EOF'
# T001 - <tên tính năng>
## Mô tả
<mô tả yêu cầu bằng lời>
## Ràng buộc
## Trạng thái: NEW
EOF
fi

echo "✅ Đã scaffold Agile Pipeline vào: $TARGET"
echo "Tiếp theo:"
echo "  1) Sửa  $TARGET/pipeline.config.yml   (stack, DB, engine mỗi bước)"
echo "  2) Sửa  $TARGET/tickets/T001.md        (yêu cầu)"
echo "  3) Mở Claude Code tại thư mục dự án, gõ:  /run-pipeline T001"
