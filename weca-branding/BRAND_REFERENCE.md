# WECA Brand Reference

Complete print and colour specifications for West of England Combined Authority branding.

## Table of Contents

- [Complete Colour Specifications](#complete-colour-specifications)
- [Pantone Colour Matching](#pantone-colour-matching)
- [RAL Colour System](#ral-colour-system)
- [CMYK Print Values](#cmyk-print-values)
- [RGB Digital Values](#rgb-digital-values)
- [Logo Technical Specifications](#logo-technical-specifications)

## Complete Colour Specifications

### West Green (Primary Brand Colour)

| Format | Value |
|--------|-------|
| **Hex** | #40A832 |
| **RGB** | R64 G168 B50 |
| **CMYK** | C73 M0 Y98 K0 |
| **Pantone** | PMS 361 |
| **RAL** | RAL 6018 |

**Usage:** Primary brand identifier, main headers, covers, key highlights

### Forest Green

| Format | Value |
|--------|-------|
| **Hex** | #1D4F2B |
| **RGB** | R29 G79 B43 |
| **CMYK** | C87 M42 Y92 K45 |
| **Pantone** | PMS 357 |
| **RAL** | RAL 6029 |

**Usage:** Secondary colour, depth, darker backgrounds, supporting elements

### Park Green

| Format | Value |
|--------|-------|
| **Hex** | #007D00 |
| **RGB** | R0 G125 B0 |
| **CMYK** | C87 M23 Y100 K12 |
| **Pantone** | PMS 356 |

**Usage:** Additional green variant, accent, charts/data visualisation

### Rich Purple

| Format | Value |
|--------|-------|
| **Hex** | #590075 |
| **RGB** | R89 G0 B117 |
| **CMYK** | C83 M100 Y19 K7 |

**Usage:** Accent colour, variety, sub-brand applications, highlights

### Claret

| Format | Value |
|--------|-------|
| **Hex** | #CE132D |
| **RGB** | R206 G19 B45 |
| **CMYK** | C12 M100 Y82 K3 |

**Usage:** Emphasis colour, calls to action, urgent information, highlights

### Soft Green

| Format | Value |
|--------|-------|
| **Hex** | #8FCC87 |
| **RGB** | R143 G204 B135 |
| **CMYK** | C50 M0 Y59 K0 |

**Usage:** Light backgrounds, overlays, softer applications, tints

### Soft Purple

| Format | Value |
|--------|-------|
| **Hex** | #9C66AB |
| **RGB** | R156 G102 B171 |
| **CMYK** | C47 M67 Y0 K0 |

**Usage:** Light accent backgrounds, softer highlights, variety

### Soft Claret

| Format | Value |
|--------|-------|
| **Hex** | #ED8073 |
| **RGB** | R237 G128 B115 |
| **CMYK** | C1 M61 Y49 K0 |

**Usage:** Softer emphasis, accessible alternatives, light backgrounds

### Warm Grey

| Format | Value |
|--------|-------|
| **Hex** | #A6A6A5 |
| **RGB** | R166 G166 B165 |
| **CMYK** | C37 M29 Y30 K8 |

**Usage:** Neutral backgrounds, supporting text, borders, dividers

### Dark Grey

| Format | Value |
|--------|-------|
| **Hex** | #3C3C3C |
| **RGB** | R60 G60 B60 |
| **CMYK** | C0 M0 Y0 K60 |

**Usage:** Body text alternative, darker backgrounds, strong contrast

### Black

| Format | Value |
|--------|-------|
| **Hex** | #1F1F1F |
| **RGB** | R31 G31 B31 |
| **CMYK** | C0 M0 Y0 K80 |

**Usage:** Primary text colour, strong contrast, logo (light backgrounds)

### White

| Format | Value |
|--------|-------|
| **Hex** | #FFFFFF |
| **RGB** | R255 G255 B255 |
| **CMYK** | C0 M0 Y0 K0 |

**Usage:** Backgrounds, reversed text, logo (dark backgrounds)

## Pantone Colour Matching

For professional printing, use Pantone Matching System (PMS) colours:

- **West Green:** PMS 361
- **Park Green:** PMS 356
- **Forest Green:** PMS 357

Pantone colours ensure colour consistency across different print vendors and materials.

## RAL Colour System

For architectural, industrial, and large-format applications:

- **West Green:** RAL 6018 (Yellow Green)
- **Forest Green:** RAL 6029 (Mint Green)

RAL colours are used for signage, building materials, and environmental graphics.

## Print Specifications

### Offset Printing
- Use CMYK values
- Request colour proofs before final run
- Maintain consistent paper stock for colour matching

### Digital Printing
- Convert RGB to CMYK in design software
- Use ICC colour profiles for accuracy
- Test print on actual substrate

### Large Format
- Use RAL or Pantone for vinyl/signage
- Account for viewing distance in colour selection
- Consider outdoor fade resistance

## Colour Accessibility

WCAG 2.1 contrast ratios, computed from the hex values. AA needs 4.5:1 for body
text, 3:1 for large text (18pt+, or 14pt+ bold).

| Background | White text | Black #1F1F1F text | Use |
|------------|-----------|--------------------|-----|
| West Green #40A832 | 3.1 | 5.4 | White only for headlines (as the templates do); black for smaller text |
| Forest Green #1D4F2B | 9.5 | 1.7 | White |
| Park Green #007D00 | 5.3 | 3.1 | White |
| Rich Purple #590075 | 12.5 | 1.3 | White |
| Claret #CE132D | 5.6 | 2.9 | White |
| Soft Green #8FCC87 | 1.9 | 8.8 | Black (or Forest Green text, 5.1) |
| Soft Purple #9C66AB | 4.3 | 3.8 | White large text only; avoid body copy |
| Soft Claret #ED8073 | 2.6 | 6.2 | Black |
| Warm Grey #A6A6A5 | 2.4 | 6.8 | Black |

West Green as *text* on white is 3.1:1: fine for large headings, fails for
body copy. Use Forest Green for coloured body-size text.

## Logo Files

| File | Colour | Background | Use |
|------|--------|------------|-----|
| `weca_logo_white.svg` | #FFFFFF | transparent | On West Green, Forest Green, Purple, Claret, photos |
| `weca_logo_black.svg` | #1F1F1F | transparent | On white and soft colours |
| `weca_logo.jpg` | dark grey | **opaque white** | White backgrounds only |
| `weca_logo.webp` | dark grey | check before use | Web, white backgrounds |

The SVGs were extracted from the PowerPoint template, so they are the supplied
artwork, not redraws. They have a `viewBox` (196.4 x 48.3) but no width/height;
set the height yourself (35px minimum on screen). For print, the SVG scales
without loss; 15mm minimum height.

Converting the JPG to PNG does **not** give a transparent logo; the white box
stays. Use the SVG.

Both Office templates already place the logo on every layout/page. Only insert
a logo file when building something outside the templates.

python-pptx and python-docx cannot insert SVG. To add a logo in Office outside
the templates, rasterise the SVG at about 4x display size (tested on Windows):

```bash
uv run --with cairosvg python -c "import cairosvg; cairosvg.svg2png(url='weca_logo_white.svg', write_to='logo.png', output_height=400)"
```

## Brand Colour Palette Quick Reference

```python
WECA_BRAND_COLORS = {
    "west_green": {
        "hex": "#40A832",
        "rgb": (64, 168, 50),
        "cmyk": (73, 0, 98, 0),
        "pantone": "PMS 361",
        "ral": "RAL 6018"
    },
    "forest_green": {
        "hex": "#1D4F2B",
        "rgb": (29, 79, 43),
        "cmyk": (87, 42, 92, 45),
        "pantone": "PMS 357",
        "ral": "RAL 6029"
    },
    "park_green": {
        "hex": "#007D00",
        "rgb": (0, 125, 0),
        "cmyk": (87, 23, 100, 12),
        "pantone": "PMS 356"
    },
    "rich_purple": {
        "hex": "#590075",
        "rgb": (89, 0, 117),
        "cmyk": (83, 100, 19, 7)
    },
    "claret": {
        "hex": "#CE132D",
        "rgb": (206, 19, 45),
        "cmyk": (12, 100, 82, 3)
    },
    "soft_green": {
        "hex": "#8FCC87",
        "rgb": (143, 204, 135),
        "cmyk": (50, 0, 59, 0)
    },
    "soft_purple": {
        "hex": "#9C66AB",
        "rgb": (156, 102, 171),
        "cmyk": (47, 67, 0, 0)
    },
    "soft_claret": {
        "hex": "#ED8073",
        "rgb": (237, 128, 115),
        "cmyk": (1, 61, 49, 0)
    },
    "warm_grey": {
        "hex": "#A6A6A5",
        "rgb": (166, 166, 165),
        "cmyk": (37, 29, 30, 8)
    },
    "dark_grey": {
        "hex": "#3C3C3C",
        "rgb": (60, 60, 60),
        "cmyk": (0, 0, 0, 60)
    },
    "black": {
        "hex": "#1F1F1F",
        "rgb": (31, 31, 31),
        "cmyk": (0, 0, 0, 80)
    },
    "white": {
        "hex": "#FFFFFF",
        "rgb": (255, 255, 255),
        "cmyk": (0, 0, 0, 0)
    }
}
```

## Python Colour Constants

### Hex Dict (for web/CSS/general use)

```python
WECA_COLORS = {
    "west_green": "#40A832",
    "forest_green": "#1D4F2B",
    "park_green": "#007D00",
    "rich_purple": "#590075",
    "claret": "#CE132D",
    "black": "#1F1F1F",
    "soft_green": "#8FCC87",
    "soft_purple": "#9C66AB",
    "soft_claret": "#ED8073",
    "dark_grey": "#3C3C3C",
    "warm_grey": "#A6A6A5",
    "white": "#FFFFFF",
}
```

### RGBColor Constants (python-pptx / python-docx)

```python
from pptx.dml.color import RGBColor
WEST_GREEN = RGBColor(64, 168, 50)
FOREST_GREEN = RGBColor(29, 79, 43)
PARK_GREEN = RGBColor(0, 125, 0)
RICH_PURPLE = RGBColor(89, 0, 117)
CLARET = RGBColor(206, 19, 45)
BLACK = RGBColor(31, 31, 31)
SOFT_GREEN = RGBColor(143, 204, 135)
SOFT_PURPLE = RGBColor(156, 102, 171)
SOFT_CLARET = RGBColor(237, 128, 115)
```

## Brand Compliance Checklist

Use before delivering any WECA-branded output:

- [ ] Exact hex colour values used (no approximations — #40A832, not #40A833)
- [ ] Logo at minimum size: 35px high (digital) / 15mm high (print)
- [ ] Logo has clear space equal to height of "T" in logo
- [ ] Correct logo variant: black on light backgrounds, white on dark (the PDF's page 5 labels are swapped; trust the pictures)
- [ ] Typography: Avenir/Open Sans where available; Trebuchet MS Bold/Regular in Office
- [ ] 77° diagonal angle applied exactly (not 45°, not 60°)
- [ ] Module widths are 2/6, 3/6, 4/6, or 5/6 only
- [ ] Icons are Material Symbols Outline, weight 300
- [ ] One lead colour per piece (West Green by default), paired with its partner across the slash
- [ ] Language is accessible and forward-looking (not bureaucratic)
- [ ] No placeholder content left (Lorem Ipsum, [YOUR CONTENT], etc.)
- [ ] Sub-brand logos (Invest Bristol + Bath, Good Employment Charter, Skills Connect, West of England Growth Hub, WEST) come from supplied artwork, never recreated

---

**Reference Version:** Based on Interim Brand Guidelines May 2025
**Last Updated:** September 2026
