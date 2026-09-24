# WECA Office Templates: Anatomy and Gotchas

Facts about the two shipped templates in `reference/`, checked by opening them
with python-pptx/python-docx and rendering through Office (September 2026).
Use with `scripts/weca_pptx.py` and `scripts/weca_docx.py`.

## Contents

- [PowerPoint template](#powerpoint-template)
- [Layout catalogue](#layout-catalogue)
- [Word template](#word-template)
- [Text outside placeholders](#text-outside-placeholders)
- [Checking the output](#checking-the-output)

## PowerPoint template

`reference/slide_template_weca.pptx`: 16:9, 13.33 x 7.5 in, one master,
27 layouts, 13 example slides.

- **Example slides come along.** `Presentation(template)` loads all 13, and
  `add_slide()` appends after them. `open_deck()` removes them.
- **Logos are baked into every layout** (white SVG on colour layouts, black on
  white layouts). Adding `weca_logo.jpg` produces a second, opaque logo.
- **Layout names are the API.** Indices are stable only for this file; match by
  name. Names carry typos and trailing spaces ("Soft caret text and stats
  slide", "Two-column text and portrait image slide "). `add()` strips them.
- **Placeholder idx does not follow reading order.** On "Three-column text",
  idx 11 is the subtitle and idx 10 is column one. On the stats layouts, the
  three big numbers are idx 12, 14, 15 and their labels 13, 16, 17. Use the
  catalogue below or run `weca_pptx.py`.
- **Title slide A's photo panel is not a placeholder.** It is a 77° freeform on
  the example slide, filled by hand (Shape Format > Picture fill). With the
  examples removed, layout A shows a plain dark panel. For generated decks use
  title slide **B** (narrow slash, no photo), or tell the user to add the photo
  in PowerPoint.
- **Picture placeholders** (`picture` below) take `placeholder.insert_picture(path)`,
  which crops to fill. Pre-crop images to the placeholder's aspect ratio or
  faces get cut.
- **Colour pairing** is fixed per layout: West Green with Forest Green, Rich
  Purple with Soft Purple, Claret with Soft Claret, Forest Green with Soft
  Green. Keep one lead colour per deck; covers, dividers and back cover match.

## Layout catalogue

Placeholders listed in reading order: `idx:type`. `t` = title, `b` = body,
`pic` = picture.

| Layout name | Placeholders (reading order) |
|---|---|
| West green / Forest Green / Rich purple / Claret title slide A | 0:t, 10:b (date or subtitle) |
| West green / Forest green / Rich purple / Claret title slide B | 0:t, 10:b |
| West green / Claret / Rich purple divider slide | 0:t (left), 10:b (big section number, right) |
| Text and landscape image slide | 0:t, 10:b subtitle, 11:b text (left), 12:pic (right) |
| Text and large landscape image slide | 0:t, 10:b subtitle, 11:b text (narrow), 12:pic (wide) |
| Text and portrait image slide | 0:t, 10:b subtitle, 11:b text, 12:pic (right) |
| Two-column text and portrait image slide | 0:t, 11:b subtitle, 15:b col 1, 16:b col 2, 14:pic |
| Three-column text | 0:t, 11:b subtitle, 10 / 12 / 13:b columns |
| Text and icons slide | 0:t, 11:b subtitle, 10:b intro (left); icon + text pairs 14+12, 15+13, 17+16, 19+18 |
| Text and images/icons slide | 0:t, 11:b subtitle; pics 14, 16, 18, 20 over texts 12, 15, 17, 19 |
| Soft green / Soft caret / Soft purple text and stats slide | 0:t, 10:b subtitle, 11:b intro; numbers 12, 14, 15; labels 13, 16, 17 |
| Soft green / Soft claret / Soft purple quote and image slide | 0:t (the quote), 10:pic |
| West green / Claret / Rich purple back cover | 0:t (optional; usually leave empty) |

Icon placeholders are 0.6 in square: insert a Material Symbols Outline icon
(weight 300) as PNG, not a photo.

## Word template

`reference/WestofEngland-Combined-MayoralAuthority-Word-Report.dotx`: A4
portrait, 7 sections.

- **python-docx refuses `.dotx`** ("content type is ...template.main+xml").
  `open_template()` relabels the content type in memory. Renaming the file to
  `.docx` does not help; the content type is inside the package.
- **It is a menu, not a blank report.** Pages 1-6 are six alternative covers
  (West Green / Claret / Rich Purple, each with and without a park photo),
  pages 7-9 sample body, pages 10-12 three back covers. Deliver one cover and
  its matching back cover. `WecaReport(cover=..., photo=...)` does this.
- **The sample body includes a screenshot of an internal database client**
  (server and schema names visible). Never ship it; `WecaReport` removes it.
- **Cover title and date are floating text boxes** repeated twice each
  (DrawingML plus VML fallback), so `doc.paragraphs` never sees them. Replace
  the `w:t` text "Title of document goes here" and "29 January 2025" across
  the body XML.
- **Heading levels are shifted.** Section headings ("1. Lorem Ipsum", Forest
  Green, 20pt) are **Heading 3**; subheadings are **Heading 4**. Heading 1 is
  a 48pt style the template never uses. `doc.add_heading(level=1)` looks wrong.
  Numbering is typed, not automatic.
- **Bullets** are `List Paragraph` with direct numbering; copying a sample list
  paragraph keeps the green bullet. `doc.add_paragraph(style="List Paragraph")`
  gives no bullet.
- **The sample table floats** (`w:tblpPr`), which leaves a gap above it when
  reused. Header row is Forest Green with white bold text, body rows alternate
  white and light grey, first column bold. `WecaReport.table()` clones it
  inline.
- **Back-cover shapes are anchored to their paragraph at -1 in.** Moving a back
  cover down a line lets the page header logo show above it. Keep the shapes
  in the first paragraph of the back-cover section.
- Body pages have the black logo in the header already.

## Text outside placeholders

Both templates' theme fonts are **Aptos**, not Trebuchet MS. Placeholders and
named styles set Trebuchet explicitly, but anything you create yourself
(PowerPoint text boxes, table cells, chart labels, SmartArt; Word text boxes)
falls back to Aptos. Set it:

```python
from pptx.util import Pt
for p in shape.text_frame.paragraphs:
    for r in p.runs:
        r.font.name = "Trebuchet MS"
```

The PowerPoint theme's Claret is `#CE132C`, one off the guideline's
`#CE132D`. Theme-coloured template elements use the former; set explicit RGB
`#CE132D` for anything new.

Native PowerPoint charts pick theme accent colours in theme order, which is not
the WECA data-viz order. Set series colours from `DATAVIZ_PALETTES.md`, or
insert a chart rendered in R/Python as an image.

## Checking the output

python-pptx and python-docx write files that open but can still be wrong
(duplicate logos, empty panels, text in the wrong column). Render and look
before handing over. On Windows with Office:

```powershell
# Word
$w = New-Object -ComObject Word.Application; $w.Visible = $false
try { $d = $w.Documents.Open("$PWD\report.docx", $false, $true); $d.ExportAsFixedFormat("$PWD\report.pdf", 17); $d.Close(0) } finally { $w.Quit() }
# PowerPoint
$p = New-Object -ComObject PowerPoint.Application
try { $d = $p.Presentations.Open("$PWD\deck.pptx", $true, $false, $false); $d.SaveAs("$PWD\deck.pdf", 32); $d.Close() } finally { $p.Quit() }
```

Then read the PDF pages as images. Elsewhere, `soffice --headless --convert-to pdf`
works but renders Trebuchet with a substitute font.
