#!/bin/bash
set -e

TODAY=$(date +%Y%m%d)
DATE=$(date +%Y-%m-%d)
YEAR=$(date +%Y)
HALF=$([ $(date +%m) -le 6 ] && echo "H1" || echo "H2")

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
EOF

# Example: daily note
cat > "daily/${TODAY}.example.md" << EOF
---
date: ${DATE}
tags:
  - daily
---

## Habits
- [x] Exercise
- [x] Deep work
- [ ] Read

## Notes
Shipped the auth refactor. Design sync pushed to tomorrow. Pair session on onboarding went well.
EOF

# Example: goals
cat > "goals/${YEAR}-${HALF}.example.md" << EOF
---
date: ${DATE}
period: ${YEAR}-${HALF}
---

## Focus areas
Engineering org health. Personal fitness. Reading more.

## Goals

| Goal | Metric | Target | Status |
|------|--------|--------|--------|
| Scale engineering team | Hires | +2 senior engineers | In progress |
| Improve deploy frequency | Deploys/week | 5+ | On track |
| Exercise consistently | Sessions/week | 4 | On track |
| Read | Books finished | 6 | Behind |

## Not doing
Rewriting the data pipeline — defer to next half.
EOF

# Example: coworker
cat > "references/Example Person.example.md" << EOF
---
categories:
  - People
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

# Example: meeting (links back to person)
cat > "meetings/${DATE}-1on1-example.example.md" << EOF
---
categories:
  - Meetings
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

# Example: evergreen note
cat > "notes/${DATE}-example-note.example.md" << EOF
---
date: ${DATE}
tags:
  - 0🌱
topics:
  - engineering
  - leadership
---

## Idea
Small feedback loops compound over time. Teams that ship daily learn faster than teams that ship monthly — not because of velocity, but because of the number of feedback cycles.

## Related
- [[Example Book]]
EOF

# Example: project
cat > "projects/example-project.example.md" << EOF
---
categories:
  - Projects
date: ${DATE}
context: work
status: active
---

## Goal
Hire 2 senior engineers by end of quarter.

## Tasks
- [x] Define role requirements with team leads
- [x] Post JDs on LinkedIn
- [ ] Complete final round interviews
- [ ] Make offers

## Notes
Pipeline is healthy. Main risk is competing offers — need to move fast on final rounds.

## Decisions
- Skipping take-home, doing live coding instead — better signal, faster process
EOF

# Example: book
cat > "references/Example Book.example.md" << EOF
---
categories:
  - Books
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

# Example: article
cat > "references/Example Article.example.md" << EOF
---
categories:
  - Articles
date: ${DATE}
author:
  - "[[Example Author]]"
url: https://example.com/article
topics:
  - leadership
  - delegation
rating: 5
via: newsletter
---

## Key points
Scaling means giving away work you love. If you don't, you become the bottleneck.
The discomfort of letting go is the signal you're doing it right.
EOF

echo "Scaffold complete. Open this folder in Obsidian to get started."
echo "Example files created with .example.md suffix — delete them when you're ready."
