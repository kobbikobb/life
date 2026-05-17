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

# Example: coworker
cat > "references/Example Person.example.md" << EOF
---
categories:
  - "[[People]]"
date: ${DATE}
context: work
org: Acme
role: Senior Engineer
---

## Strengths
Strong technical communicator. Good at breaking down complex problems.

## Growth areas
Needs more exposure to cross-team collaboration.

## Review notes
Performing well. Ready for more ownership.

## Meetings
- [[${DATE}-1on1-example]]
EOF

# Example: meeting note (links back to person)
cat > "notes/${DATE}-1on1-example.example.md" << EOF
---
categories:
  - "[[Meetings]]"
date: ${DATE}
context: work
org: Acme
people:
  - "[[Example Person]]"
topics:
  - growth
  - workload
---

## Notes
Discussed current workload and growth plan. Example Person wants more ownership on architecture decisions.

## Actions
- [ ] Share RFC template
- [ ] Set up monthly design review
EOF

# Example: book
cat > "references/Example Book.example.md" << EOF
---
categories:
  - "[[Books]]"
date: ${DATE}
author:
  - "[[Example Author]]"
genre:
  - engineering
year: 2020
rating: 5
status: done
topics:
  - leadership
  - systems thinking
via: recommended by colleague
---

## Notes
Key idea: small feedback loops compound over time. Worth revisiting every year.
EOF

echo "Scaffold complete. Open this folder in Obsidian to get started."
echo "Example files created with .example.md suffix — delete them when you're ready."
