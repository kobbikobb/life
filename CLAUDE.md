# Vault context for AI assistants

This is a personal life management vault in plain Markdown. Use this file to understand the structure before generating or editing notes.

## Vault structure

| Folder | Contents | Naming pattern |
|--------|----------|----------------|
| `daily/` | One note per day — habits + reflection | `YYYYMMDD.md` |
| `goals/` | Half-year direction and metrics | `YYYY-HX.md` |
| `todo/` | Three static task files | `1-today.md`, `2-soon.md`, `3-someday.md` |
| `projects/` | Multi-week initiatives | `slug.md` |
| `notes/` | Evergreen ideas, decisions, learnings | `YYYY-MM-DD-slug.md` |
| `meetings/` | Meeting notes (work + personal) | `YYYY-MM-DD-slug.md` |
| `references/` | People, books, articles, movies | `Name.md` or `Title.md` |
| `_templates/` | Blank templates for each note type | — |

## Frontmatter schema

All templates share a consistent set of YAML fields:

| Field | Type | Used in | Values |
|-------|------|---------|--------|
| `categories` | list | most types | `Meetings`, `People`, `Books`, `Articles`, `Projects` |
| `date` | ISO date | all | `YYYY-MM-DD` |
| `context` | string | meetings, people, projects | `work`, `personal` |
| `people` | list of wikilinks | meetings | `["[[Name]]"]` |
| `topics` | list of strings | meetings, notes | free-form |
| `tags` | list | daily, notes | `daily`, `0🌱`, `0🌲` |
| `status` | string | books, projects | `to-read`/`reading`/`done` · `active`/`done` |
| `rating` | integer | books, articles | `1`–`5` |

## AI use cases

### 1. Weekly review from daily notes
**Input:** paste 5–7 daily notes for the week  
**Output:** summary of themes, completed work, mood trends, and next-week priorities  
**Save to:** `notes/YYYY-MM-DD-weekly-review.md` with `tags: [weekly]`

### 2. Meeting note → action items
**Input:** paste a raw meeting note from `meetings/`  
**Output:** bulleted action items with owner and due date, formatted for copy-paste into `todo/2-soon.md`  
**Save to:** add `## Actions` block in the meeting note, items into todo

### 3. Person synthesis from meeting notes
**Input:** paste all meeting notes referencing a specific person  
**Output:** updated `## Strengths`, `## Growth areas`, and `## Review notes` sections ready for their `references/` file  
**Save to:** `references/Name.md`
