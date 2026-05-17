# Vault context for AI assistants

This is a personal life management vault in plain Markdown. Use this file to understand the structure before generating or editing notes.

## Vault structure

| Folder | Contents | Naming pattern |
|--------|----------|----------------|
| `daily/` | One note per day — habits + reflection | `YYYYMMDD.md` |
| `goals/` | Half-year direction and metrics | `YYYY-HX.md` |
| `todo/` | Three static task files | `1-today.md`, `2-soon.md`, `3-someday.md` |
| `projects/` | Multi-week initiatives | `slug.md` |
| `meetings/` | Meeting notes (work + personal) | `YYYY-MM-DD-slug.md` |
| `notes/` | Evergreen ideas, decisions, learnings | `YYYY-MM-DD-slug.md` |
| `references/` | People, books, articles, movies | `Name.md` or `Title.md` |
| `_templates/` | Blank templates for each note type | — |

## Obsidian rules

These rules keep the vault functional in Obsidian. Breaking them silently degrades the backlink graph and Bases views without any obvious error.

**1. `categories` must use wiki-link syntax.**
```yaml
categories:
  - "[[Meetings]]"   # correct — creates backlink to references/Meetings.md
  - Meetings         # wrong — plain string, no backlink
```
Valid values: `"[[Meetings]]"`, `"[[People]]"`, `"[[Books]]"`, `"[[Articles]]"`, `"[[Projects]]"`.

**2. Person and author references must use wiki-links.**
```yaml
people:
  - "[[John Smith]]"   # correct — links to references/John Smith.md
author:
  - "[[Jane Doe]]"     # correct
```

**3. Naming conventions are load-bearing.**
Obsidian Bases and Dataview queries filter by folder path. Wrong folder = note invisible to the right view.

| Folder | Pattern | Example |
|--------|---------|---------|
| `daily/` | `YYYYMMDD.md` | `20260517.md` |
| `goals/` | `YYYY-HX.md` | `2026-H1.md` |
| `meetings/` | `YYYY-MM-DD-slug.md` | `2026-05-17-1on1-john.md` |
| `notes/` | `YYYY-MM-DD-slug.md` | `2026-05-17-systems-thinking.md` |
| `projects/` | `slug.md` | `eng-hiring-q2.md` |
| `references/` | `Name.md` or `Title.md` | `John Smith.md`, `Blade Runner.md` |

**4. Plain markdown only — no Obsidian-specific syntax in templates.**
Templates must work in any editor. Do not add Dataview queries, Templater expressions, or callout syntax to templates. Keep those in vault-local files not tracked by git.

## Frontmatter schema

| Field | Type | Used in | Values |
|-------|------|---------|--------|
| `categories` | list of wikilinks | most types | `"[[Meetings]]"`, `"[[People]]"`, etc. |
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
