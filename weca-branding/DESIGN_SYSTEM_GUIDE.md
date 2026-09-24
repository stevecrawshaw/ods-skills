# WECA Design System Guide

Detailed guide for implementing the WECA "Always Moving Forward" 77-degree diagonal design system.

## Table of Contents

- [Design Philosophy](#design-philosophy)
- [The 77-Degree Diagonal](#the-77-degree-diagonal)
- [Six-Column Grid System](#six-column-grid-system)
- [Module Sizes and Layouts](#module-sizes-and-layouts)
- [Implementation Examples](#implementation-examples)
- [Python Calculations](#python-calculations)
- [Layout Patterns](#layout-patterns)

## Design Philosophy

**"Always Moving Forward"**

The WECA design system embodies forward momentum through a distinctive 77-degree diagonal inspired by the lead "W" in the logo. This creates dynamic, engaging layouts while maintaining professional consistency.

**Core Principles:**
1. **Forward motion** - 77° diagonal always points forward
2. **Modular flexibility** - 6-column grid adapts to content
3. **Visual hierarchy** - Diagonal creates natural reading flow
4. **Brand consistency** - System ensures recognisable WECA style

## The 77-Degree Diagonal

### Why 77 Degrees?

The 77-degree angle is derived directly from the West of England logo's "W" letterform, creating an authentic connection between the logo and design system.

### Diagonal Rules

✅ **Always use 77 degrees** - No other angles
✅ **Forward direction** - Points toward future/right
✅ **Clean intersections** - Align with grid columns
❌ **Never backward** - No reverse diagonals
❌ **Never multiple angles** - One angle only (77°)
❌ **Never distorted** - Keep angle precise

### Calculating the Diagonal

```python
import math

WECA_ANGLE = 77  # degrees

# Convert to radians for calculations
angle_radians = math.radians(WECA_ANGLE)

# Calculate slope
slope = math.tan(angle_radians)
print(f"Slope: {slope:.4f}")  # ~4.3315

# For a diagonal line across width
def calculate_diagonal_endpoint(start_x, start_y, width):
    """
    Calculate end point of 77° diagonal line

    Args:
        start_x: Starting X coordinate
        start_y: Starting Y coordinate (top of line)
        width: Horizontal distance to travel

    Returns:
        (end_x, end_y): End point coordinates
    """
    end_x = start_x + width
    # Height = width * slope for 77° angle
    height = width * slope
    end_y = start_y + height
    return (end_x, end_y)

# Example: Diagonal across 300px width
start = (0, 0)
end = calculate_diagonal_endpoint(0, 0, 300)
print(f"Diagonal from {start} to {end}")
# Diagonal from (0, 0) to (300, 1299.45)
```

## Six-Column Grid System

### Grid Fundamentals

Divide any layout width into **6 equal columns** to create the modular grid:

```python
def create_column_grid(page_width, gutter=0):
    """
    Create 6-column grid for WECA design system

    Args:
        page_width: Total width of layout
        gutter: Space between columns (optional)

    Returns:
        list: Column starting positions
    """
    if gutter > 0:
        # Account for gutters (5 gutters between 6 columns)
        available_width = page_width - (5 * gutter)
        column_width = available_width / 6
    else:
        column_width = page_width / 6

    columns = []
    for i in range(6):
        x_pos = i * (column_width + gutter)
        columns.append({
            "index": i,
            "x": x_pos,
            "width": column_width
        })

    return columns, column_width

# Example: A4 landscape page
page_width = 1920  # pixels
columns, col_width = create_column_grid(page_width)
print(f"Column width: {col_width}px")
# Column width: 320px
```

### Standard Measurements

**PowerPoint (Widescreen 16:9):**
- Slide width: 10 inches (12,192,000 EMUs)
- Slide height: 5.625 inches (6,858,000 EMUs)
- Column width: 1.667 inches (2,032,000 EMUs)

**Word (A4 Portrait):**
- Page width: 8.27 inches (210mm)
- Column width: 1.378 inches (35mm)

**Screen (1920px wide):**
- Page width: 1920px
- Column width: 320px

## Module Sizes and Layouts

### Allowed Module Widths

Only these module widths are permitted:

| Module Size | Columns | Fraction | Use Case |
|-------------|---------|----------|----------|
| **2/6** | 2 columns | 1/3 width | Narrow sidebars, pull quotes, small images |
| **3/6** | 3 columns | 1/2 width | Equal splits, balanced layouts, quotes |
| **4/6** | 4 columns | 2/3 width | Primary content, main text blocks |
| **5/6** | 5 columns | 5/6 width | Wide content, hero sections, full images |

❌ **Not allowed:** 1/6 (too narrow), 6/6 (full width, no diagonal)

### Module Calculation

```python
def calculate_module_width(page_width, module_fraction):
    """
    Calculate module width based on grid

    Args:
        page_width: Total layout width
        module_fraction: One of (2/6, 3/6, 4/6, 5/6)

    Returns:
        float: Module width in same units as page_width
    """
    allowed_fractions = [2/6, 3/6, 4/6, 5/6]
    if module_fraction not in allowed_fractions:
        raise ValueError(f"Module must be one of {allowed_fractions}")

    return page_width * module_fraction

# Examples
page_width = 1920
print(f"2/6 module: {calculate_module_width(page_width, 2/6):.0f}px")  # 640px
print(f"3/6 module: {calculate_module_width(page_width, 3/6):.0f}px")  # 960px
print(f"4/6 module: {calculate_module_width(page_width, 4/6):.0f}px")  # 1280px
print(f"5/6 module: {calculate_module_width(page_width, 5/6):.0f}px")  # 1600px
```

## Implementation Examples

Use these only when building outside the templates (a blank canvas, a
non-standard size, a social graphic). Template layouts already contain the
slash, so drawing one on a template slide doubles it.

### 77° slash panel in python-pptx (tested, renders in PowerPoint)

`split_top` is where the slash meets the top edge. The edge then runs down and
to the left by `height / tan(77°)` (1.73 in on a 7.5 in slide), so the shape
leans forward like the "W". Place `split_top` so the *top* of the slash sits on
a module boundary, as in the guideline's 2/6 to 5/6 grids.

```python
import math
from pptx.util import Inches
from pptx.dml.color import RGBColor

def add_slash_panel(slide, prs, split_top_in: float, hex_colour: str, side: str = "left"):
    W, H = prs.slide_width, prs.slide_height
    run = int(H / math.tan(math.radians(77)))
    xt = Inches(split_top_in)
    xb = xt - run
    pts = [(0, 0), (xt, 0), (xb, H), (0, H)] if side == "left" else           [(xt, 0), (W, 0), (W, H), (xb, H)]
    fb = slide.shapes.build_freeform(*pts[0], scale=1.0)
    fb.add_line_segments(pts[1:], close=True)
    shp = fb.convert_to_shape()
    shp.fill.solid()
    shp.fill.fore_color.rgb = RGBColor.from_string(hex_colour)
    shp.line.fill.background()
    shp.shadow.inherit = False  # default style adds a faint edge shadow
    return shp

# 4/6 West Green lead panel with Forest Green partner on a 13.33 x 7.5 in slide
col = 13.333 / 6
add_slash_panel(slide, prs, 4 * col, "1D4F2B", side="right")
add_slash_panel(slide, prs, 4 * col, "40A832", side="left")
```

Draw the right panel first so the left panel's edge sits on top.

For CSS use `transform: skewX(-13deg)` (90° − 77°); see `WEB_CSS.md`.

## Python Calculations

### Complete Grid Calculator Class

```python
import math
from dataclasses import dataclass
from typing import Tuple

@dataclass
class WECAGrid:
    """WECA Design System Grid Calculator"""

    page_width: float
    page_height: float
    gutter: float = 0

    ANGLE = 77
    COLUMNS = 6
    ALLOWED_MODULES = [2, 3, 4, 5]  # In sixths

    def __post_init__(self):
        self.column_width = (self.page_width - (5 * self.gutter)) / self.COLUMNS
        self.angle_rad = math.radians(self.ANGLE)
        self.slope = math.tan(self.angle_rad)

    def module_width(self, columns: int) -> float:
        """Calculate width for module of given column count"""
        if columns not in self.ALLOWED_MODULES:
            raise ValueError(f"Module must use {self.ALLOWED_MODULES} columns")
        return (self.column_width * columns) + (self.gutter * (columns - 1))

    def diagonal_endpoint(self, start_x: float, start_y: float,
                         width: float) -> Tuple[float, float]:
        """Calculate endpoint of 77° diagonal"""
        end_x = start_x + width
        height = width * self.slope
        end_y = start_y + height
        return (end_x, end_y)

    def module_position(self, column_start: int, column_span: int) -> dict:
        """Get position and size for a module"""
        if column_span not in self.ALLOWED_MODULES:
            raise ValueError(f"Span must be {self.ALLOWED_MODULES}")

        x = column_start * (self.column_width + self.gutter)
        width = self.module_width(column_span)

        return {
            "x": x,
            "width": width,
            "columns": column_span,
            "fraction": f"{column_span}/6"
        }

# Example usage
grid = WECAGrid(page_width=1920, page_height=1080, gutter=20)

# Get 3/6 module starting at column 0
module = grid.module_position(column_start=0, column_span=3)
print(f"3/6 Module: {module}")
# {'x': 0, 'width': 980, 'columns': 3, 'fraction': '3/6'}

# Calculate diagonal across module
start = (module['x'], 100)
end = grid.diagonal_endpoint(start[0], start[1], module['width'])
print(f"Diagonal: {start} -> {end}")
```

### PowerPoint-Specific Calculations

```python
from pptx.util import Inches, Emu

def pptx_grid_calculator(presentation):
    """Create grid calculator for PowerPoint slide"""
    # Convert EMUs to inches
    slide_width_inches = presentation.slide_width / 914400
    slide_height_inches = presentation.slide_height / 914400

    grid = WECAGrid(
        page_width=slide_width_inches,
        page_height=slide_height_inches,
        gutter=0.1  # 0.1 inch gutter
    )

    return grid

# Usage
prs = Presentation()
grid = pptx_grid_calculator(prs)

# Add shape in 4/6 module at column 1
module = grid.module_position(column_start=1, column_span=4)
shape = slide.shapes.add_textbox(
    Inches(module['x']),
    Inches(1),
    Inches(module['width']),
    Inches(3)
)
```

## Layout Patterns

### Pattern 1: Hero Image with 3/6 Overlay

```
[    Image (full width)    ]
[  Text  ][77° West Green  ]
[ 3/6    ][    3/6         ]
```

**Use:** Cover slides, section dividers, hero sections

### Pattern 2: Content with Sidebar

```
[  Main Content    ][ Side ]
[      4/6         ][  2/6 ]
```

**Use:** Standard content slides, articles with sidebars

### Pattern 3: Two-Column Equal

```
[   Column A   ][   Column B   ]
[      3/6     ][      3/6     ]
```

**Use:** Comparisons, before/after, dual content

### Pattern 4: Wide Content with Quote

```
[      Main Content        ][ Q ]
[          5/6             ][1/6] (not allowed)
```

❌ **Not allowed** - 1/6 too narrow

**Alternative:**
```
[   Quote  ][    Main Content     ]
[    2/6   ][        4/6          ]
```

### Pattern 5: Asymmetric Emphasis

```
[ Small ][    Large Content     ]
[  2/6  ][        4/6           ]
```

**Use:** Featured content, emphasis on one side

## Application Examples from Brand Guidelines

The official guidelines (pages 16-17) show these applications:

1. **Report covers** - 3/6 text, 3/6 West Green diagonal
2. **Pull quotes** - 3/6 Soft Green background with diagonal
3. **Data displays** - 4/6 main content, 2/6 stats sidebar
4. **Hero images** - 5/6 image, 1/6 diagonal accent (adjusted to 5/6 + diagonal)
5. **Back covers** - 5/6 contact info, West Green diagonal

## Best Practises

### Do:
✅ Use exact 77° angle
✅ Stick to 2/6, 3/6, 4/6, 5/6 modules
✅ Align module edges with grid columns
✅ Use diagonal for visual interest
✅ Create forward momentum

### Don't:
❌ Use other angles (45°, 60°, 90°, etc.)
❌ Create 1/6 or 6/6 modules
❌ Reverse diagonal direction
❌ Overlap diagonals from different directions
❌ Distort or modify the angle

## Troubleshooting

**Diagonal looks wrong:**
- Verify exactly 77° angle
- Check that it points forward (upper-left to lower-right)
- Ensure it aligns with grid columns

**Module doesn't fit:**
- Recalculate column widths
- Verify using allowed fractions only (2/6, 3/6, 4/6, 5/6)
- Check for gutter spacing

**Layout feels cluttered:**
- Use fewer, larger modules
- Add white space between elements
- Consider 3/6 or 4/6 instead of 5/6

---

**Design System Version:** Based on Interim Brand Guidelines May 2025
**Last Updated:** January 2026
