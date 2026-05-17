# life

A minimal Obsidian vault template for personal and work life management. Combines the productivity loop (goals, daily habits, todos) with a knowledge layer (notes, references, projects) — inspired by [kepano's vault structure](https://stephango.com/vault).

## Philosophy

- One vault for work and personal
- Metadata over folders — `categories` frontmatter + Obsidian Bases for filtering
- Minimal folders, consistent naming, lean templates
- Plain markdown — works in any editor, git-friendly

## Structure

```
goals/        half-year direction
daily/        one file per day — habits + reflection
todo/         all tasks (work + personal)
projects/     ongoing multi-week initiatives
meetings/     meeting notes (work + personal)
notes/        ideas, decisions, evergreen thoughts
references/   people, books, movies, articles
HOME.md       navigation index
_templates/   all templates
```

## Getting started

1. Clone or download this repo
2. Run `bash scaffold.sh` — creates todo files, reference index stubs, today's daily note, and wires up git hooks
3. Open the folder as an Obsidian vault
4. Install recommended plugins (see below)
5. Edit `_templates/daily.md` — replace placeholder habits with your own

## Daily CLI

`bash next.sh` prints today's status: habits done, open todos, and context-aware nudges (goal focus in the morning, migration reminder in the evening, weekly review on Fridays, active projects on Mondays). Run it from the vault root at the start and end of your day.

## Templates

| Template | Use for | Folder |
|----------|---------|--------|
| `daily.md` | habits checklist + evening reflection | `daily/` |
| `weekly.md` | end-of-week review | `notes/` |
| `goals.md` | half-year goals with metrics | `goals/` |
| `meeting.md` | any meeting (work or personal) | `meetings/` |
| `note.md` | idea or evergreen thought | `notes/` |
| `project.md` | ongoing multi-week initiative | `projects/` |
| `person.md` | contact | `references/` |
| `coworker.md` | coworker with strengths + review notes | `references/` |
| `book.md` | book to read or finished | `references/` |
| `article.md` | saved article or web clip | `references/` |

## Naming conventions

| Folder | Pattern | Example |
|--------|---------|---------|
| `daily/` | `YYYYMMDD.md` | `20260517.md` |
| `goals/` | `YYYY-HX.md` | `2026-H1.md` |
| `meetings/` | `YYYY-MM-DD-slug.md` | `2026-05-17-1on1-john.md` |
| `notes/` | `YYYY-MM-DD-slug.md` | `2026-05-17-systems-thinking.md` |
| `projects/` | `slug.md` | `eng-hiring-q2.md` |
| `references/` | `Name.md` | `John Smith.md`, `Blade Runner.md` |
| `todo/` | fixed files | `1-today.md`, `2-soon.md`, `3-someday.md` |

## Frontmatter schema

All templates use a consistent set of properties designed for Obsidian Bases filtering.

| Field | Values |
|-------|--------|
| `categories` | `[[Meetings]]`, `[[People]]`, `[[Books]]`, `[[Articles]]`, `[[Projects]]` |
| `context` | `work`, `personal` |
| `status` | `to-read` / `reading` / `done` (books) · `active` / `done` (projects) |
| `rating` | `1–5` |
| `date` | ISO date — used consistently across all templates |
| `tags` | `daily` · `weekly` · `0🌱` (seedling idea) · `0🌲` (mature/evergreen idea) |

`categories` uses Obsidian wiki-links so every reference note backlinks to its category index page automatically.

## When to use what

| Folder | When | Cadence |
|--------|------|---------|
| `daily/` | Check habits morning, reflect evening | Daily |
| `todo/` | Anything that needs doing — work or personal | Ongoing |
| `goals/` | Set direction for the next 6 months, check in monthly | Twice a year |
| `meetings/` | Meeting just happened | Ad hoc |
| `notes/` | Idea worth keeping, decision to capture | Ad hoc |
| `projects/` | Initiative that spans multiple weeks | Ad hoc |
| `references/` | Person to remember, book to track, article worth keeping | Ad hoc |

If it's something you *do* → todo. If it's something you *think* → note. If it's something you *track over time* → reference or project.

## Todo

Three static files — you edit them directly:

| File | Purpose |
|------|---------|
| `1-today.md` | What you are doing today |
| `2-soon.md` | What's coming up next |
| `3-someday.md` | Backlog — ideas and tasks with no deadline |

Tasks use Work / Personal sections so you see everything in one place without mixing contexts:

```markdown
## Work
- [ ] [ENG-123] Finish architecture review
- [x] Sync with Sara on onboarding

## Personal
- [ ] Book dentist
```

**Getting an overview:**
- *What am I doing today?* → `1-today.md`
- *What's in progress?* → unchecked items in `1-today.md`
- *What's done today?* → checked `- [x]` items in `1-today.md`
- *What's next?* → `2-soon.md`
- *What's on the backlog?* → `3-someday.md`

**Daily discipline — without this the files rot:**
1. Morning: review `1-today.md`, pull in anything from `2-soon.md`
2. Evening: archive completed tasks, push unfinished items back to `2-soon.md` or carry forward deliberately

**For tasks linked to Jira/Linear**, add the issue key inline so you can find the full context:

```markdown
- [ ] [ENG-123] Finish architecture review
```

## Recommended plugins

| Plugin | Why |
|--------|-----|
| **QuickAdd** | One-keystroke capture — trigger any template from the command palette, auto-names the file |
| **Templater** | Auto-fills `date` and slugs in templates (optional — `next.sh` handles daily note creation without it) |
| **Shell Commands** | Run `next.sh` from inside Obsidian via hotkey or vault-open event |

**Obsidian Bases** (built-in since Obsidian 1.8) handles category index views natively — no Dataview needed. The `categories` wikilinks in every template are already wired for it.

## License

MIT
