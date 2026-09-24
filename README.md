# ods-skills

Claude Code skills for building pages on the West of England Combined Authority (WECA) open data portal, which runs on Opendatasoft (Huwise).

Each skill is a folder with a `SKILL.md`. Claude Code loads the skill when a task matches its `description`.

## Skills

| Skill | Use it for |
| ------- | ------------ |
| [`ods-pages`](ods-pages/SKILL.md) | Writing and debugging portal pages: `ods-*` widgets, AngularJS templates, page CSS, and why a widget renders blank. Widget reference and recipes are in `ods-pages/reference/`. |
| [`weca-opendata`](weca-opendata/SKILL.md) | Querying the portal's Explore v2.1 API with `curl` and `jq`: finding datasets, checking fields and facets, ODSQL traps, exporting to CSV, Parquet, GeoJSON and others. |
| [`weca-branding`](weca-branding/SKILL.md) | WECA brand rules: colours, Trebuchet MS typography, logos, CSS for the web, and R palettes for charts. |

The three are meant to be used together. Check fields and facets with `weca-opendata`, build the page with `ods-pages`, and style it with `weca-branding`.

## Install

Copy or symlink the skill folders into your Claude Code skills directory:

```powershell
# Windows (PowerShell)
Copy-Item -Recurse ods-pages, weca-opendata, weca-branding "$HOME\.claude\skills\"
```

```bash
# Git Bash / Linux / macOS
cp -r ods-pages weca-opendata weca-branding ~/.claude/skills/
```

Restart Claude Code, then ask for something in scope, for example "add a bar chart of emissions by local authority to the portal page". The skill is chosen from its description; you can also invoke one by name, such as `/ods-pages`.

## Requirements

- **`weca-opendata`**: `curl` and `jq`. On Windows, run in Git Bash, because PowerShell aliases `curl` to `Invoke-WebRequest`. Private datasets need an API key in `ODS_API_KEY`.
- **`weca-branding`**: the PowerPoint and Word templates and the brand guidelines PDF are in the /reference subfolder. The logos, colour references, web CSS and R palettes (`weca_palettes.R`) are in the skill folder.
- **`ods-pages`**: none. `reference/preview-harness.html` is a local page for previewing widgets outside the portal.

## Layout

```
ods-pages/        SKILL.md + reference/ (widget catalogue, filters, CSS, recipes)
weca-opendata/    SKILL.md
weca-branding/    SKILL.md, brand and design-system guides, logos, R palettes
```

## Caveats

- `weca-opendata` notes were checked against the live portal in September 2026. Dataset ids, counts and field names change; re-check before relying on them.
- ODS widgets fail silently, rendering nothing without console errors. `ods-pages` opens with a checklist of the common causes.
