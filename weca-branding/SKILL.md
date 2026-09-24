---
name: weca-branding
description: >
  West of England Mayoral Combined Authority (WECA) brand rules, official
  PowerPoint (.pptx) and Word (.dotx) templates, vector logos, and tested
  Python helpers to build branded decks and reports from them. Use whenever a
  task creates, edits or reviews anything WECA-branded: presentations, slide
  decks, reports, briefings, Word documents, charts, maps, dashboards, web or
  Opendatasoft portal pages, social graphics, print or signage; or mentions
  WECA / West of England colours (West Green #40A832, Forest Green, Park
  Green, Rich Purple, Claret, soft tints), Avenir, Open Sans or Trebuchet MS
  typography, the 77-degree "always moving forward" slash, the 6-column
  module grid, logo clear space or minimum size, Material Symbols icons, or
  sub-brands (Invest Bristol + Bath, Skills Connect, Growth Hub, Good
  Employment Charter). Also covers print values (CMYK, Pantone, RAL), WCAG
  contrast for the palette, and R/ggplot2 data-visualisation palettes.
---

# WECA Branding

Source of truth: `reference/West Of England-InterimBrandGuidelines-2025.pdf`
(May 2025, 18 pages). Everything below was checked against it and against the
templates themselves. Where this file and your memory of "typical council
branding" disagree, this file wins.

## Assets (paths relative to this skill's directory)

| File | What it is |
|------|------------|
| `reference/slide_template_weca.pptx` | Official deck: 27 layouts, 13 example slides |
| `reference/WestofEngland-Combined-MayoralAuthority-Word-Report.dotx` | Official report: 6 cover variants, sample body, 3 back covers |
| `reference/West Of England-InterimBrandGuidelines-2025.pdf` | Brand guidelines |
| `scripts/weca_pptx.py` | `open_deck()`, `add(prs, layout_name, ...)`; run it to list layouts |
| `scripts/weca_docx.py` | `WecaReport(cover, photo, title, date)` with `heading/para/bullets/table/save` |
| `weca_logo_white.svg`, `weca_logo_black.svg` | Vector logos, transparent (extracted from the template) |
| `weca_logo.jpg`, `weca_logo.webp` | Dark logo on **opaque white**: white backgrounds only |
| `weca_palettes.R` | R palettes and ggplot2 scales |

Scripts need `uv run --with python-pptx` / `--with python-docx`. Import them
by adding `scripts/` to `sys.path` or copy them into the user's project.

## Route the task

| Task | Do | Load | Do NOT load |
|------|----|------|-------------|
| PowerPoint deck | `weca_pptx.open_deck()` + `add()` by layout name | **MANDATORY:** `TEMPLATE_USAGE.md` (layout catalogue, placeholder idx map) | DESIGN_SYSTEM_GUIDE, BRAND_REFERENCE |
| Word report | `weca_docx.WecaReport(...)` | **MANDATORY:** `TEMPLATE_USAGE.md` § Word template | DESIGN_SYSTEM_GUIDE |
| Chart, map, R/ggplot code | `source("weca_palettes.R")` | **MANDATORY:** `DATAVIZ_PALETTES.md` (palette choice, UA/MCA colour mapping) | TEMPLATE_USAGE |
| HTML page, dashboard, ODS portal page | Copy tokens and patterns | **MANDATORY:** `WEB_CSS.md` | TEMPLATE_USAGE, BRAND_REFERENCE |
| Layout from scratch (poster, social tile, non-template slide) | Draw slash + modules | `DESIGN_SYSTEM_GUIDE.md` | TEMPLATE_USAGE |
| Print, signage, CMYK/Pantone/RAL, contrast check | Look values up | `BRAND_REFERENCE.md` | Others |
| Brand review of someone's file | Use the NEVER list and checklist below | `BRAND_REFERENCE.md` § checklist | |

Always prefer the templates over drawing: every template layout already
carries the right logo, slash, colours and fonts.

## Facts you will otherwise get wrong

**Typefaces.** The brand typefaces are **Avenir** (Black headlines, Medium
intro) and **Open Sans** (Bold subheads, Regular body). **Trebuchet MS** is
the approved *substitute* where Avenir is unavailable, e.g. Microsoft Office:
Bold for headlines and subheads, Regular for intro and body. So: Office
output uses Trebuchet MS throughout (the templates already do); designed print
uses Avenir + Open Sans; web uses the stack in `WEB_CSS.md`. Never Arial,
Calibri or Aptos. Both templates' *theme* font is Aptos, so any text box,
table or chart label you create outside a placeholder silently becomes
Aptos. Set Trebuchet MS explicitly.

**Logo colour.** White logo on colour or photos, black (#1F1F1F) logo on
white and soft tints. Page 5 of the PDF has these labels swapped; the images
on that page are correct. The JPG/WebP logos have an opaque white box; on any
coloured background use `weca_logo_white.svg`. Minimum 35 px high on screen,
15 mm in print; clear space on all sides = height of the "T" in "WEST".
Preferred position top-right or bottom-right; top/bottom-left allowed; centred
only when the logo is the hero element. There is also a Mayor logo lock-up
(the Mayor's name in pink above "Mayor of the West of England"); use only
supplied artwork for it and never recreate it.

**Sub-brands** (guideline p.4): Invest Bristol + Bath, Good Employment
Charter, Skills Connect, West of England Growth Hub, and the green "WEST"
wordmark. Each has its own logo artwork, none of which is in this skill. Ask
for the file; never typeset a sub-brand name as a logo.

**Colour system.** Four lead colours, each with a fixed partner that sits
across the slash:

| Lead | Hex | Partner across slash | Text on lead |
|------|-----|----------------------|--------------|
| West Green | `#40A832` | Forest Green `#1D4F2B` (or a photo) | White, headline size only (3.1:1) |
| Forest Green | `#1D4F2B` | Soft Green `#8FCC87` | White |
| Rich Purple | `#590075` | Soft Purple `#9C66AB` | White |
| Claret | `#CE132D` | Soft Claret `#ED8073` | White |

Also: Park Green `#007D00` (data and accents), Black `#1F1F1F` (text; not
`#000000`), Grey `#3C3C3C`, Warm Grey `#A6A6A5`, White. West Green is the
default lead. Purple and Claret are full lead colours (the templates ship
covers in both), not "accents to ration". Pick one lead per document and keep
covers, dividers and back cover in it. Soft tints are partners and panel
fills, never text on white.

**Design system.** The slash is always 77°, leaning forward (top further right
than bottom), taken from the "W". Divide the width into 6 columns; the lead
panel may be 2/6, 3/6, 4/6 or 5/6 wide, nothing else. In CSS that is
`skewX(-13deg)`.

**Icons.** Google Material Symbols, **Outline** style, weight **300**, one
colour from the palette. Not Filled, not Rounded, not Font Awesome.

## NEVER

- **NEVER add a logo to a template slide or page.** Every layout already has
  one; you get two, and the JPG brings a white box.
- **NEVER use `Presentation(template)` and start adding slides** without
  removing the 13 example slides (`open_deck()` does it). The deck ships with
  empty sample slides in front of yours.
- **NEVER open the .dotx with plain `Document()`**; it raises "not a Word
  file". Use `open_template()` / `WecaReport`.
- **NEVER ship the Word template's sample body.** It contains lorem ipsum and a
  screenshot of an internal database tool with server names.
- **NEVER leave all six Word covers in.** Pick one cover and its matching back
  cover.
- **NEVER use `add_heading(level=1)` in the Word template.** Section headings
  are Heading 3 and subheadings Heading 4; Heading 1 is an unused 48pt style.
- **NEVER fill placeholders by position guesswork.** idx order is not reading
  order (stats slide numbers are idx 12, 14, 15). Use the catalogue.
- **NEVER approximate colours** (`#40A833`, `#000000` for text, the PowerPoint
  theme's `#CE132C` Claret). Brand recognition depends on exact values.
- **NEVER use West Green or soft tints for body text on white**: 3.1:1 and
  below fails WCAG AA. Use Black or Forest Green.
- **NEVER set the slash at 45° or 60°, lean it backwards, or use 1/6 or 6/6
  modules.** The guideline allows exactly four module widths.
- **NEVER rotate, recolour, distort, add effects to, or recompose the logo**, or
  place it on a busy photo without contrast (guideline p.8).
- **NEVER default to generic government styling**: blue palettes, serif body
  fonts, stock handshake photos. WECA's distinctiveness is green + slash.
- **NEVER write "hereby", "it should be noted", "further to"** in branded copy;
  the brand voice is plain and forward-looking.

## Workflow: PowerPoint

```python
import sys
from pathlib import Path
SKILL_DIR = Path.home() / ".claude/skills/weca-branding"
sys.path.insert(0, str(SKILL_DIR / "scripts"))
from weca_pptx import open_deck, add

prs = open_deck()
add(prs, "West green title slide B", title="Local Transport Plan 2026",
    placeholders={10: "September 2026"})
add(prs, "West green divider slide", title="Where we are now", placeholders={10: "01"})
add(prs, "Soft green text and stats slide", title="Headline figures",
    placeholders={10: "Subtitle", 11: "Intro text",
                  12: "1,000", 14: "624", 15: "55%",      # numbers
                  13: "label", 16: "label", 17: "label"})  # labels under them
add(prs, "West green back cover")
prs.save("deck.pptx")
```

Title slide A has a hand-filled photo panel that is not a placeholder; for
generated decks use B unless the user will add the photo.

## Workflow: Word report

```python
from weca_docx import WecaReport  # scripts/ on sys.path as above

r = WecaReport(cover="green", photo=True,       # green | claret | purple
               title="Bus Service Improvement Plan", date="September 2026")
r.heading("1. Introduction")                    # numbering is typed, not automatic
r.para("...")
r.subheading("Key findings")
r.bullets(["...", "..."])
r.table([["Area", "2023", "2024"], ["Bristol", "30", "33"]])  # row 0 = header
r.save("report.docx")
```

The photo covers use the template's park photo. To use another photo, open the
result in Word and change the picture; do not swap it in XML unless asked.

## Verify before handing over

Office files that open without error can still be wrong. Render to PDF and look
at every page (Office COM commands in `TEMPLATE_USAGE.md` § Checking the
output). Check:

1. One logo per page, correct colour, not on top of text
2. No sample slides, lorem ipsum, "Title of document goes here" or
   "29 January 2025" left
3. Text in the intended column (idx mix-ups show here)
4. Nothing in Aptos or Arial (check text you added outside placeholders)
5. Cover, dividers and back cover share one lead colour
6. Body text contrast passes (no West Green or soft-tint body copy)

If a render shows an empty dark panel on a title slide, you used title slide A
without a photo.
