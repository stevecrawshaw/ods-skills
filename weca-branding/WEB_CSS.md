# WECA branding for web pages

Tested CSS patterns from WECA Opendatasoft portal pages (`epc-domestic`,
`ghg-emissions`, September 2026). Colours are from
[`DATAVIZ_PALETTES.md`](DATAVIZ_PALETTES.md); this file covers how to apply
them on screen.

## Tokens

```scss
$west-green: #40A832;   // brand identifier: header band, accents, rules
$forest-green: #1D4F2B; // headings, figures, default bar colour, 77° slash
$soft-green: #D9EED6;   // card backgrounds only (20% West Green tint)
$warm-grey: #A6A6A5;    // neutral / negative values
$text: #1F1F1F;
$rule: #E5E5E5;
```

- **Fonts:** `font-family: "Trebuchet MS", "Open Sans", sans-serif;` on the
  page root *and* on headings, because portal themes set their own heading
  font. Headings bold, Forest Green.
- **West Green text on white fails contrast** (about 3:1) for body-size text.
  Use it for bands, bars and rules; use Forest Green for text.
- White text on West Green is acceptable only at heading or lead size
  (bold 1.15rem+). Keep body copy off the band.

## Header band with the 77° slash

A Forest Green panel on the right edge, skewed so its left edge leans
forward at 77°. `skewX(-13deg)` because 90° − 77° = 13°. Hidden on phones,
where it would crowd the title.

```scss
.page-hero {
    position: relative;
    overflow: hidden;
    padding: 3rem 0;
    background: $west-green;
    color: #fff;

    &::after {
        content: "";
        position: absolute;
        top: 0;
        right: -4rem;
        width: 12rem;
        height: 100%;
        background: $forest-green;
        transform: skewX(-13deg);
        transform-origin: bottom; // lean forward: bottom edge fixed
    }

    h1, p {
        position: relative;
        z-index: 1; // above the slash
    }
}

@media (max-width: 767px) {
    .page-hero::after { display: none; }
}
```

## Headline figure cards

```scss
.kpis {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(12rem, 1fr));
    gap: 1rem;
}

.kpi {
    padding: 1rem;
    background: $soft-green;
    border-left: 4px solid $west-green;

    &__value { display: block; font-size: 1.9rem; font-weight: bold; color: $forest-green; }
    &__label { font-size: 0.9rem; }
}
```

The same card treatment (Soft Green, West Green left rule) works for a
details panel beside a map.

## Section headings

A West Green left rule marks each story section:

```scss
.story__text h2 {
    border-left: 4px solid $west-green;
    padding-left: 0.75rem;
    color: $forest-green;
}
```

## Charts

- **Default single-series colour: Forest Green**, with West Green to pick
  out one item (the West of England among other areas, or the selected
  year). This keeps West Green meaningful.
- **Categories (up to 8):** the `qualitative` palette in order. The sector
  mapping used on `ghg-emissions`:
  Transport `#40A832`, Domestic `#590075`, Industry `#CE132D`,
  Commercial `#007D00`, Agriculture `#9C66AB`, Waste `#ED8073`,
  Public Sector `#1D4F2B`, LULUCF `#A6A6A5`.
- **Three categories:** Forest Green, Rich Purple, Claret.
- **Ordered bands (EPC A–G):** `diverging_green_claret_7`, but replace the
  near-white midpoint `#F0F0EE` with Warm Grey `#A6A6A5`, which is
  invisible on a white page otherwise. Use dark text on the light bands
  (C, D).
- **Negative values:** Warm Grey, with the minus sign shown.
- Highcharts paints a white background; on a tinted page set
  `.highcharts-background { fill: transparent; }`.

## Maps

- Boundaries: Forest Green fill at 0.6 opacity with white borders; the
  focus area in West Green.
- Choropleths: `continuous_green` for good-is-high measures,
  `continuous_purple` for density or spend, `continuous_claret` for risk.
