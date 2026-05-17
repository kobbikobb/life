#!/bin/bash

if [ ! -f "_templates/daily.md" ]; then
  echo "Error: run from vault root" >&2
  exit 1
fi

TODAY=$(date +%Y%m%d)
DATE=$(date +%Y-%m-%d)
HOUR=$(date +%H)
DOW=$(date +%u) # 1=Monday
DAILY="daily/${TODAY}.md"

# Create today's daily note if missing
if [ ! -f "$DAILY" ]; then
  sed "s/^date:.*$/date: ${DATE}/" _templates/daily.md > "$DAILY"
  echo "✓ Created today's daily note"
  echo ""
fi

count() { grep -c "$1" "$2" 2>/dev/null | tr -d ' ' || echo 0; }
lines() { grep "$1" "$2" 2>/dev/null | sed 's/^- \[ \] //' | grep -v '^$'; }

echo "── $(date '+%a %d %b · %H:%M') ─────────────────────"

# Habits
TOTAL=$(count '^\- \[' "$DAILY")
DONE=$(count '^\- \[x\]' "$DAILY")
if [ "$TOTAL" -gt 0 ]; then
  echo "Habits  $DONE/$TOTAL done"
  lines '^\- \[ \]' "$DAILY" | while read -r h; do echo "  · $h"; done
  echo ""
fi

# Open todos
TOTAL_T=$(count '^\- \[' todo/1-today.md)
DONE_T=$(count '^\- \[x\]' todo/1-today.md)
if [ "$TOTAL_T" -gt 0 ]; then
  echo "Today   $DONE_T/$TOTAL_T done"
  lines '^\- \[ \]' todo/1-today.md | while read -r t; do echo "  · $t"; done
  echo ""
fi

# Morning: show current goal focus
if [ "$HOUR" -lt 10 ]; then
  GOALS_FILE=$(ls goals/*.md 2>/dev/null | grep -v example | sort | tail -1)
  if [ -n "$GOALS_FILE" ]; then
    FOCUS=$(awk '/## Focus areas/{found=1; next} found && NF{print; exit}' "$GOALS_FILE")
    [ -n "$FOCUS" ] && echo "Focus   $FOCUS" && echo ""
  fi
fi

# Evening: migration nudge
if [ "$HOUR" -ge 16 ]; then
  OPEN=$(count '^\- \[ \]' todo/1-today.md)
  if [ "$OPEN" -gt 0 ]; then
    echo "↳ $OPEN open task(s) — migrate or drop before tomorrow"
    echo ""
  fi
  NEXT=$(grep '^\- \[ \]' todo/2-soon.md 2>/dev/null | head -1 | sed 's/^- \[ \] //')
  [ -n "$NEXT" ] && echo "Up next  $NEXT" && echo ""
fi

# Friday: create weekly review if missing
if [ "$DOW" -eq 5 ]; then
  WEEKLY="notes/${DATE}-week.md"
  if [ ! -f "$WEEKLY" ]; then
    sed "s/^date:.*$/date: ${DATE}/" _templates/weekly.md > "$WEEKLY"
    echo "✓ Created weekly review: $WEEKLY"
    echo ""
  else
    echo "↳ Weekly review exists — fill it in before EOD"
    echo ""
  fi
fi

# Monday: active projects + groom reminder
if [ "$DOW" -eq 1 ]; then
  ACTIVE=$(grep -rl 'status: active' projects/ 2>/dev/null | sed 's|projects/||;s|\.md||')
  if [ -n "$ACTIVE" ]; then
    echo "Projects (active)"
    echo "$ACTIVE" | while read -r p; do echo "  · $p"; done
    echo ""
  fi
  echo "↳ Monday: review 2-soon and 3-someday, write weekly note"
  echo ""
fi

echo "────────────────────────────────────────────────"
