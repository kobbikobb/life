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
notes/        meetings, ideas, evergreen thoughts
references/   people, books, movies, articles
HOME.md       dashboard
_templates/   all templates
```

## Getting started

1. Clone or download this repo
2. Open the folder as an Obsidian vault
3. Install recommended plugins (see below)
4. Edit `_templates/daily.md` — replace placeholder habits with your own
5. Copy a template to start your first note

## Templates

| Template | Use for | Folder |
|----------|---------|--------|
| `daily.md` | habits checklist + evening reflection | `daily/` |
| `goals.md` | half-year goals with metrics | `goals/` |
| `meeting.md` | any meeting (work or personal) | `notes/` |
| `note.md` | idea or evergreen thought | `notes/` |
| `project.md` | ongoing multi-week initiative | `projects/` |
| `person.md` | contact | `references/` |
| `book.md` | book to read or finished | `references/` |
| `movie.md` | movie to watch or watched | `references/` |
| `article.md` | saved article or web clip | `references/` |

## Naming conventions

| Folder | Pattern | Example |
|--------|---------|---------|
| `daily/` | `YYYYMMDD.md` | `20260517.md` |
| `goals/` | `YYYY-HX.md` | `2026-H1.md` |
| `notes/` | `YYYY-MM-DD-slug.md` | `2026-05-17-1on1-john.md` |
| `projects/` | `slug.md` | `eng-hiring-q2.md` |
| `references/` | `Name.md` | `John Smith.md`, `Blade Runner.md` |
| `todo/` | fixed files | `1-today.md`, `2-soon.md`, `3-someday.md` |

## Frontmatter schema

All templates use a consistent set of properties designed for Obsidian Bases filtering.

| Field | Values |
|-------|--------|
| `categories` | `[[Meetings]]`, `[[People]]`, `[[Books]]`, `[[Movies]]`, `[[Articles]]`, `[[Projects]]` |
| `context` | `work`, `personal` |
| `status` | `to-read` / `reading` / `done` (books) · `to-watch` / `watched` (movies) · `active` / `done` (projects) |
| `rating` | `1–5` |
| `date` | ISO date — used consistently across all templates |
| `tags` | `daily` · `0🌱` (seedling idea) · `0🌲` (mature/evergreen idea) |

`categories` uses Obsidian wiki-links so every reference note backlinks to its category index page automatically.

## When to use what

| Folder | When | Cadence |
|--------|------|---------|
| `daily/` | Check habits morning, reflect evening | Daily |
| `todo/` | Anything that needs doing — work or personal | Ongoing |
| `goals/` | Set direction for the next 6 months, check in monthly | Twice a year |
| `notes/` | Meeting just happened, idea worth keeping, decision to capture | Ad hoc |
| `projects/` | Initiative that spans multiple weeks | Ad hoc |
| `references/` | Person to remember, book/movie to track, article worth keeping | Ad hoc |

If it's something you *do* → todo. If it's something you *think* → note. If it's something you *track over time* → reference or project.

## Todo convention

Tasks are split into Work / Personal sections within each tier. Prefix is optional — the section heading does the grouping. For tasks linked to an external tracker (Jira, Linear), add the issue key inline:

```markdown
- [ ] [ENG-123] Finish architecture review
```

## Recommended plugins

| Plugin | Why |
|--------|-----|
| **Templater** | Auto-fills `date`, slugs, and filenames — required |
| **Dataview** | Turns category index pages into live queryable tables |
| **Periodic Notes** | Automates daily file creation on vault open |

## License

MIT
