# WECA Data Visualisation Palettes

Colour palettes derived from the WECA brand guidelines for use in charts, maps, and infographics.

**R script:** `weca_palettes.R` in this skill directory.

---

## Colour Foundation

All palettes are built from the official WECA brand colours plus computed tints and shades:

| Name | Hex | Use in palettes |
|------|-----|-----------------|
| West Green | `#40A832` | Sequential, qualitative, diverging |
| Forest Green | `#1D4F2B` | Sequential dark end, diverging dark end |
| Park Green | `#007D00` | Sequential step |
| Soft Green | `#8FCC87` | Sequential light step, diverging light step |
| Rich Purple | `#590075` | Sequential dark end, qualitative, diverging |
| Soft Purple | `#9C66AB` | Sequential mid, qualitative, diverging light |
| Claret | `#CE132D` | Sequential, qualitative, diverging |
| Soft Claret | `#ED8073` | Sequential mid, diverging light |
| Warm Grey | `#A6A6A5` | Qualitative soft |

**Derived tints and shades (not in base brand palette):**

| Hex | Derivation |
|-----|------------|
| `#D9EED6` | 20% West Green + 80% white |
| `#DDCCE3` | 20% Rich Purple + 80% white |
| `#BC99C7` | 40% Rich Purple + 60% white |
| `#7A3390` | 80% Rich Purple + 20% white |
| `#F5CFD5` | 20% Claret + 80% white |
| `#9A0E22` | 75% Claret (darkened) |
| `#670A16` | 50% Claret (darkened) |
| `#8C0017` | Dark Claret for diverging endpoint |
| `#3E0052` | Dark Purple for diverging endpoint |
| `#F0F0EE` | Near-white neutral for discrete diverging midpoint |
| `#F5F5F5` | Near-white neutral for continuous diverging midpoint |

---

## Palette Catalogue

### Qualitative (Discrete)

For unordered categorical data. Colours are chosen to be perceptually distinct.

#### `qualitative` (8 colours)

```
#40A832  #590075  #CE132D  #007D00  #9C66AB  #ED8073  #1D4F2B  #8FCC87
```

Order is intentional: West Green leads (dominant brand colour), then the most
distinct secondaries, then softer/darker variants.

Use up to 8 categories. For fewer categories, take the first N colours.

#### `qualitative_core` (4 colours)

```
#40A832  #590075  #CE132D  #007D00
```

Preferred choice for presentations and reports with up to 4 categories.
High contrast, all full-saturation brand colours.

#### `qualitative_soft` (4 colours)

```
#8FCC87  #9C66AB  #ED8073  #A6A6A5
```

For backgrounds, secondary series, or de-emphasised categories.
Lower contrast; do not use as primary series when `qualitative_core` suffices.

---

### Sequential Discrete

For ordered data with one meaningful direction (low to high).
All palettes run light to dark (reverse with `direction = -1`).

#### `sequential_green` (5 colours)

```
#D9EED6  #8FCC87  #40A832  #007D00  #1D4F2B
```

Primary sequential palette. Use for population counts, satisfaction scores,
progress indicators, or any non-negative scale where green connotes positive.

#### `sequential_purple` (5 colours)

```
#DDCCE3  #BC99C7  #9C66AB  #7A3390  #590075
```

For data where green carries unwanted connotations (e.g., financial spend,
density, inequality). Pairs well with `sequential_green` for side-by-side maps.

#### `sequential_claret` (5 colours)

```
#F5CFD5  #ED8073  #CE132D  #9A0E22  #670A16
```

For data where urgency or warning is appropriate (e.g., deprivation, risk,
deficit). Use sparingly -- claret is an accent colour, not a primary.

---

### Diverging Discrete

For data with a meaningful neutral midpoint (e.g., change from baseline,
satisfaction above/below average, forecast vs. actual).

#### `diverging_green_claret_7` (7 colours) -- preferred

```
#1D4F2B  #40A832  #8FCC87  #F0F0EE  #ED8073  #CE132D  #8C0017
```

7-step diverging from Forest Green (strong positive) through near-white
(neutral/zero) to Dark Claret (strong negative). The near-white midpoint
reads clearly as "zero" on maps and charts.

#### `diverging_green_claret_5` (5 colours)

```
#1D4F2B  #8FCC87  #F0F0EE  #ED8073  #CE132D
```

Compact 5-step version. Useful in small multiples or when colour legend
space is limited.

#### `diverging_green_purple_7` (7 colours)

```
#1D4F2B  #40A832  #8FCC87  #F0F0EE  #9C66AB  #590075  #3E0052
```

Green-to-purple diverging. Use when the two directions are both neutral in
connotation (e.g., left vs. right vote share, age skew, geographic direction).
Avoids the "red = bad" association of the green-claret palette.

#### `diverging_green_purple_5` (5 colours)

```
#1D4F2B  #8FCC87  #F0F0EE  #9C66AB  #590075
```

Compact 5-step version of the green-purple diverging palette.

---

### Sequential Continuous

Smooth ramps defined by key colour stops. Use `weca_ramp()` or
`scale_*_weca_c()` to interpolate to any number of steps.

#### `continuous_green`

Stops: `#FFFFFF` `#D9EED6` `#8FCC87` `#40A832` `#007D00` `#1D4F2B`

White to Forest Green. Default choice for choropleth maps and heatmaps.

#### `continuous_purple`

Stops: `#FFFFFF` `#DDCCE3` `#9C66AB` `#590075`

White to Rich Purple. Alternative to green for density or spend maps.

#### `continuous_claret`

Stops: `#FFFFFF` `#F5CFD5` `#ED8073` `#CE132D`

White to Claret. Use for risk, deprivation, or deficit maps.

---

### Diverging Continuous

Smooth diverging ramps. The midpoint is near-white (`#F5F5F5`) to create
a clear visual separation between the two directions.

#### `diverging_green_claret`

Stops: `#1D4F2B` `#40A832` `#8FCC87` `#F5F5F5` `#ED8073` `#CE132D` `#8C0017`

#### `diverging_green_purple`

Stops: `#1D4F2B` `#40A832` `#8FCC87` `#F5F5F5` `#9C66AB` `#590075` `#3E0052`

---

---

## Administrative Area Colour Mappings

Fixed, named colour assignments for charts that compare geographic areas.
These are **not** general palettes — each colour is permanently tied to a
specific area and must not be reused for a different area in the same chart.

Accessed via named vectors in R: `WECA_UA_COLOURS`, `WECA_MCA_COLOURS`,
`WECA_NATIONAL_COLOURS`, `WECA_AREA_COLOURS`.

### UA-level — comparing constituent Unitary Authorities

Use when the chart compares the four constituent UAs against each other.

| Area | Short | Hex | Brand name |
|------|-------|-----|------------|
| Bath & North East Somerset | B&NES | `#590075` | Rich Purple |
| Bristol | Bristol | `#CE132D` | Claret |
| North Somerset | North Somerset | `#ED8073` | Soft Claret |
| South Gloucestershire | South Gloucestershire | `#1D4F2B` | Forest Green |

Two named vectors are provided:
- `WECA_UA_COLOURS` — full place names (`"Bath & North East Somerset"`, etc.)
- `WECA_UA_COLOURS_SHORT` — abbreviated labels (`"B&NES"`, etc.)

Use the short form when axis labels or legend space is limited.

### MCA-level — West of England vs other MCAs

Use when presenting MCA-aggregated data alongside or against other Combined
Authorities.

| Area | Hex | Brand name |
|------|-----|------------|
| West of England | `#40A832` | West Green |
| Other MCAs | `#1D4F2B` | Forest Green |

Vector: `WECA_MCA_COLOURS`

### National-level — UK, GB, England, England & Wales, etc.

Use when presenting national benchmark data regardless of the specific
geographic scope (UK, GB, England, England & Wales, etc.).

| Area | Hex | Brand name |
|------|-----|------------|
| National | `#1F1F1F` | Black |

Vector: `WECA_NATIONAL_COLOURS`

### Combined — mixed-level charts

`WECA_AREA_COLOURS` provides all named areas in one vector for charts that
show multiple geographic levels simultaneously (e.g. 4 UA bars + WoE MCA
total + national benchmark line):

```
Bath & North East Somerset  #590075  Rich Purple
Bristol                     #CE132D  Claret
North Somerset              #ED8073  Soft Claret
South Gloucestershire       #1D4F2B  Forest Green
West of England             #40A832  West Green
Other MCAs                  #A6A6A5  Warm Grey
National                    #1F1F1F  Black
```

`Other MCAs` is mapped to Warm Grey in the combined vector to avoid a
Forest Green clash with South Gloucestershire when both appear together.

### R usage

```r
source("path/to/weca_palettes.R")

# -- ggplot2 ------------------------------------------------------------------

# 4-UA comparison bar chart
ggplot(df, aes(x = area, y = value, fill = area)) +
  geom_col() +
  scale_fill_manual(values = WECA_UA_COLOURS)

# Short labels (tight space)
ggplot(df, aes(x = area, y = value, fill = area)) +
  geom_col() +
  scale_fill_manual(values = WECA_UA_COLOURS_SHORT)

# MCA comparison
ggplot(df, aes(x = mca, y = value, colour = mca)) +
  geom_point(size = 3) +
  scale_colour_manual(values = WECA_MCA_COLOURS)

# Mixed: UA bars + WoE total + national line
ggplot(df, aes(x = area, y = value, fill = area)) +
  geom_col() +
  geom_hline(aes(yintercept = national_avg, colour = "National")) +
  scale_fill_manual(values = WECA_AREA_COLOURS) +
  scale_colour_manual(values = WECA_AREA_COLOURS)

# Display area colour mapping
show_weca_areas()
```

---

## Choosing a Palette

| Data type | Recommended palette |
|-----------|---------------------|
| Unordered categories (<=4) | `qualitative_core` |
| Unordered categories (5-8) | `qualitative` |
| De-emphasised categories | `qualitative_soft` |
| Single ordered scale (maps/heatmaps) | `continuous_green` |
| Single ordered scale (5-class) | `sequential_green` |
| Ordered scale avoiding green meaning | `sequential_purple` or `continuous_purple` |
| Risk / urgency scale | `sequential_claret` or `continuous_claret` |
| Change from baseline / above-below average | `diverging_green_claret_7` or `diverging_green_claret` |
| Neutral diverging (no pos/neg connotation) | `diverging_green_purple_7` or `diverging_green_purple` |
| Choropleth with class intervals | `scale_fill_weca_b("continuous_green")` |

**Rule of thumb:** Default to green. Use purple as a second sequential. Use
claret only when urgency or risk is the explicit message.

---

## R Usage

```r
source("path/to/weca_palettes.R")

# --- Discrete palettes -------------------------------------------------------

weca_palette("qualitative")                  # all 8 colours
weca_palette("sequential_green", 3)          # lightest 3 greens
weca_palette("diverging_green_claret_7")     # 7-step diverging
weca_palette("sequential_green", direction = -1)  # reversed (dark to light)

# Pre-built convenience vectors
weca_qual    # qualitative (8)
weca_green   # sequential_green (5)
weca_purple  # sequential_purple (5)
weca_claret  # sequential_claret (5)
weca_div_gc  # diverging_green_claret_7
weca_div_gp  # diverging_green_purple_7

# --- Continuous ramps --------------------------------------------------------

ramp <- weca_ramp("continuous_green")   # returns colorRampPalette function
ramp(100)                               # 100 interpolated colours

weca_palette("diverging_green_claret", n = 50)  # 50-step diverging

# --- ggplot2 -----------------------------------------------------------------

library(ggplot2)

# Discrete colour / fill
ggplot(mpg, aes(class, fill = class)) +
  geom_bar() +
  scale_fill_weca_d("qualitative")

# Discrete sequential (ordered factor)
ggplot(df, aes(x, y, colour = ordered_var)) +
  geom_point() +
  scale_colour_weca_d("sequential_green")

# Continuous sequential
ggplot(df, aes(x, y, fill = value)) +
  geom_tile() +
  scale_fill_weca_c("continuous_green")

# Continuous diverging (supply midpoint via limits if needed)
ggplot(df, aes(x, y, fill = change)) +
  geom_tile() +
  scale_fill_weca_c("diverging_green_claret")

# Binned / stepped choropleth
ggplot(shapefile_df, aes(fill = deprivation_score)) +
  geom_sf() +
  scale_fill_weca_b("continuous_claret", n_breaks = 5)

# Reversed palette
ggplot(df, aes(fill = rank)) +
  geom_col() +
  scale_fill_weca_d("sequential_green", direction = -1)

# --- Base R ------------------------------------------------------------------

# Pie / bar with qualitative palette
barplot(1:8, col = weca_qual)

# Heatmap with continuous green
image(matrix(1:100, 10), col = weca_ramp("continuous_green")(100))

# Display all palettes
show_weca_palettes()                  # all
show_weca_palettes("discrete")        # discrete only
show_weca_palettes("continuous")      # continuous only
show_weca_palette("sequential_green") # single palette strip
```

---

## Accessibility Notes

- All qualitative and sequential palettes were checked to have adequate
  luminance contrast between adjacent steps.
- Diverging palettes use near-white as the midpoint so the neutral class is
  visually distinct from both directions.
- For colourblind safety, prefer `qualitative_core` over the full 8-colour
  `qualitative` palette. Green and claret may be indistinguishable for
  deuteranopes -- consider `diverging_green_purple` where colour-vision
  accessibility is critical.
- Always provide a text label or pattern alternative for print outputs.

---

**Palette Version:** 1.0
**Based on:** WECA Interim Brand Guidelines May 2025
**Last Updated:** June 2026
