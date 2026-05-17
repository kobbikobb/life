#!/bin/bash
set -e

TODAY=$(date +%Y%m%d)
DATE=$(date +%Y-%m-%d)

# Todo
cat _templates/todo-1-today.md > todo/1-today.md
cat _templates/todo-2-soon.md > todo/2-soon.md
cat _templates/todo-3-someday.md > todo/3-someday.md

# Reference index stubs
for category in Books People Meetings Articles Projects; do
  cat > "references/${category}.md" << EOF
---
tags:
  - category
---
EOF
done

# Today's daily note
cat > "daily/${TODAY}.md" << EOF
---
date: ${DATE}
tags:
  - daily
---

## Habits
- [ ] Exercise
- [ ] Deep work
- [ ] Read

## Notes

## Evening

**Drained by:**

**Energized by:**

**Grateful for:**
EOF

echo "Scaffold complete. Open this folder in Obsidian to get started."
