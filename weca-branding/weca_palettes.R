# weca_palettes.R
# WECA Brand Colour Palettes for Data Visualisation
# Based on WECA Interim Brand Guidelines May 2025
#
# Usage:
#   source("weca_palettes.R")
#   weca_palette("qualitative")           # returns character vector
#   weca_palette("sequential_green", 3)   # first 3 colours
#   weca_palette("continuous_green", 100) # 100-step interpolated ramp
#   weca_ramp("diverging_green_claret")   # returns colorRampPalette function
#
# ggplot2:
#   scale_colour_weca_d("qualitative")
#   scale_fill_weca_d("sequential_green")
#   scale_colour_weca_c("diverging_green_claret")
#   scale_fill_weca_c("sequential_green")

# Base brand colours ----------------------------------------------------------

WECA_COLOURS <- c(
  west_green   = "#40A832",
  forest_green = "#1D4F2B",
  park_green   = "#007D00",
  rich_purple  = "#590075",
  claret       = "#CE132D",
  soft_green   = "#8FCC87",
  soft_purple  = "#9C66AB",
  soft_claret  = "#ED8073",
  warm_grey    = "#A6A6A5",
  dark_grey    = "#3C3C3C",
  black        = "#1F1F1F",
  white        = "#FFFFFF"
)

# Palette definitions ---------------------------------------------------------
# Discrete palettes: named character vectors of hex colours.
# Continuous palettes: key colour stops passed to colorRampPalette().

WECA_PALETTES <- list(

  # --------------------------------------------------------------------------
  # QUALITATIVE -- distinct hues for categorical data (unordered categories)
  # --------------------------------------------------------------------------

  # Up to 8 perceptually distinct brand colours
  qualitative = c(
    "#40A832",  # West Green
    "#590075",  # Rich Purple
    "#CE132D",  # Claret
    "#007D00",  # Park Green
    "#9C66AB",  # Soft Purple
    "#ED8073",  # Soft Claret
    "#1D4F2B",  # Forest Green
    "#8FCC87"   # Soft Green
  ),

  # 4-colour core for presentations / small category sets
  qualitative_core = c(
    "#40A832",  # West Green
    "#590075",  # Rich Purple
    "#CE132D",  # Claret
    "#007D00"   # Park Green
  ),

  # 4-colour soft for backgrounds or de-emphasised categories
  qualitative_soft = c(
    "#8FCC87",  # Soft Green
    "#9C66AB",  # Soft Purple
    "#ED8073",  # Soft Claret
    "#A6A6A5"   # Warm Grey
  ),

  # --------------------------------------------------------------------------
  # SEQUENTIAL DISCRETE -- ordered data, single-hue ramps, light to dark
  # --------------------------------------------------------------------------

  sequential_green = c(
    "#D9EED6",  # very light green (tint)
    "#8FCC87",  # Soft Green
    "#40A832",  # West Green
    "#007D00",  # Park Green
    "#1D4F2B"   # Forest Green
  ),

  sequential_purple = c(
    "#DDCCE3",  # very light purple (tint)
    "#BC99C7",  # light purple
    "#9C66AB",  # Soft Purple
    "#7A3390",  # dark-medium purple
    "#590075"   # Rich Purple
  ),

  sequential_claret = c(
    "#F5CFD5",  # very light claret (tint)
    "#ED8073",  # Soft Claret (warm salmon)
    "#CE132D",  # Claret
    "#9A0E22",  # dark claret
    "#670A16"   # very dark claret
  ),

  # --------------------------------------------------------------------------
  # DIVERGING DISCRETE -- ordered data with a meaningful neutral midpoint
  # Green = one direction, Claret/Purple = opposite direction
  # --------------------------------------------------------------------------

  diverging_green_claret_7 = c(
    "#1D4F2B",  # Forest Green    (strong green)
    "#40A832",  # West Green
    "#8FCC87",  # Soft Green      (light green)
    "#F0F0EE",  # near-white      (neutral midpoint)
    "#ED8073",  # Soft Claret     (light red)
    "#CE132D",  # Claret
    "#8C0017"   # Dark Claret     (strong red)
  ),

  diverging_green_claret_5 = c(
    "#1D4F2B",  # Forest Green
    "#8FCC87",  # Soft Green
    "#F0F0EE",  # neutral midpoint
    "#ED8073",  # Soft Claret
    "#CE132D"   # Claret
  ),

  diverging_green_purple_7 = c(
    "#1D4F2B",  # Forest Green    (strong green)
    "#40A832",  # West Green
    "#8FCC87",  # Soft Green      (light green)
    "#F0F0EE",  # near-white      (neutral midpoint)
    "#9C66AB",  # Soft Purple     (light purple)
    "#590075",  # Rich Purple
    "#3E0052"   # Dark Purple     (strong purple)
  ),

  diverging_green_purple_5 = c(
    "#1D4F2B",  # Forest Green
    "#8FCC87",  # Soft Green
    "#F0F0EE",  # neutral midpoint
    "#9C66AB",  # Soft Purple
    "#590075"   # Rich Purple
  ),

  # --------------------------------------------------------------------------
  # SEQUENTIAL CONTINUOUS -- colour stops for smooth interpolation
  # Pass to colorRampPalette() or use weca_ramp() / scale_*_weca_c()
  # --------------------------------------------------------------------------

  continuous_green = c(
    "#FFFFFF",
    "#D9EED6",
    "#8FCC87",
    "#40A832",
    "#007D00",
    "#1D4F2B"
  ),

  continuous_purple = c(
    "#FFFFFF",
    "#DDCCE3",
    "#9C66AB",
    "#590075"
  ),

  continuous_claret = c(
    "#FFFFFF",
    "#F5CFD5",
    "#ED8073",
    "#CE132D"
  ),

  # --------------------------------------------------------------------------
  # DIVERGING CONTINUOUS -- colour stops for smooth diverging interpolation
  # --------------------------------------------------------------------------

  diverging_green_claret = c(
    "#1D4F2B",  # Forest Green
    "#40A832",  # West Green
    "#8FCC87",  # Soft Green
    "#F5F5F5",  # near-white midpoint
    "#ED8073",  # Soft Claret
    "#CE132D",  # Claret
    "#8C0017"   # Dark Claret
  ),

  diverging_green_purple = c(
    "#1D4F2B",  # Forest Green
    "#40A832",  # West Green
    "#8FCC87",  # Soft Green
    "#F5F5F5",  # near-white midpoint
    "#9C66AB",  # Soft Purple
    "#590075",  # Rich Purple
    "#3E0052"   # Dark Purple
  )
)

# Administrative area colour mappings -----------------------------------------
# Named vectors: names are the area labels used in charts/legends.
# Use with scale_fill_manual(values = WECA_UA_COLOURS) in ggplot2.

# Constituent Unitary Authorities (UA-level comparisons)
WECA_UA_COLOURS <- c(
  "Bath & North East Somerset" = "#590075",  # Rich Purple
  "Bristol"                    = "#CE132D",  # Claret
  "North Somerset"             = "#ED8073",  # Soft Claret
  "South Gloucestershire"      = "#1D4F2B"   # Forest Green
)

# Short-form aliases (for tight axis/legend labels)
WECA_UA_COLOURS_SHORT <- c(
  "B&NES"               = "#590075",
  "Bristol"             = "#CE132D",
  "North Somerset"      = "#ED8073",
  "South Gloucestershire" = "#1D4F2B"
)

# MCA-level comparisons (West of England vs other MCAs)
WECA_MCA_COLOURS <- c(
  "West of England" = "#40A832",  # West Green (primary brand)
  "Other MCAs"      = "#1D4F2B"   # Forest Green (supporting)
)

# National-level data (UK, GB, England, England & Wales, etc.)
WECA_NATIONAL_COLOURS <- c(
  "National" = "#1F1F1F"  # Black
)

# Combined: all named areas in one vector for mixed charts
# (e.g. 4 UAs + WoE MCA total on same chart)
WECA_AREA_COLOURS <- c(
  "Bath & North East Somerset" = "#590075",
  "Bristol"                    = "#CE132D",
  "North Somerset"             = "#ED8073",
  "South Gloucestershire"      = "#1D4F2B",
  "West of England"            = "#40A832",
  "Other MCAs"                 = "#A6A6A5",  # Warm Grey (neutral secondary)
  "National"                   = "#1F1F1F"
)

# Palette type lists ----------------------------------------------------------

.WECA_CONTINUOUS <- c(
  "continuous_green",
  "continuous_purple",
  "continuous_claret",
  "diverging_green_claret",
  "diverging_green_purple"
)

.WECA_DISCRETE <- setdiff(names(WECA_PALETTES), .WECA_CONTINUOUS)

# Core accessor ---------------------------------------------------------------

#' Return WECA palette colours
#'
#' @param name        Palette name (see names(WECA_PALETTES)).
#' @param n           Number of colours. For discrete palettes must be <=
#'                    palette length unless interpolate = TRUE. For continuous
#'                    palettes controls how many steps are generated (default 256).
#' @param interpolate For discrete palettes, set TRUE to interpolate beyond
#'                    the defined stops. Default FALSE.
#' @param direction   1 = normal (default), -1 = reversed.
#' @return Character vector of hex colour codes.
weca_palette <- function(name, n = NULL, interpolate = FALSE, direction = 1) {
  if (!name %in% names(WECA_PALETTES)) {
    stop(
      "Palette '", name, "' not found.\n",
      "Discrete:   ", paste(.WECA_DISCRETE, collapse = ", "), "\n",
      "Continuous: ", paste(.WECA_CONTINUOUS, collapse = ", ")
    )
  }

  stops <- WECA_PALETTES[[name]]
  is_continuous <- name %in% .WECA_CONTINUOUS

  colours <- if (is_continuous) {
    n_out <- if (is.null(n)) 256L else as.integer(n)
    colorRampPalette(stops)(n_out)
  } else if (is.null(n)) {
    stops
  } else {
    n <- as.integer(n)
    if (n > length(stops) && !interpolate) {
      stop(
        "Palette '", name, "' has ", length(stops), " colours but n = ", n,
        ". Use interpolate = TRUE to interpolate."
      )
    }
    if (n > length(stops)) colorRampPalette(stops)(n) else stops[seq_len(n)]
  }

  if (direction == -1) rev(colours) else colours
}

#' Return a colorRampPalette function for a WECA palette
#'
#' @param name      Palette name.
#' @param direction 1 = normal, -1 = reversed.
#' @return A function(n) that returns n interpolated colours.
weca_ramp <- function(name, direction = 1) {
  stops <- weca_palette(name, direction = direction)
  colorRampPalette(stops)
}

# ggplot2 scales --------------------------------------------------------------

#' Discrete colour scale using a WECA qualitative or sequential palette
#'
#' @param palette   Name of a discrete WECA palette.
#' @param direction 1 = normal, -1 = reversed.
#' @param ...       Passed to ggplot2::scale_colour_manual().
scale_colour_weca_d <- function(palette = "qualitative", direction = 1, ...) {
  colours <- weca_palette(palette, direction = direction)
  ggplot2::scale_colour_manual(values = colours, ...)
}

#' @rdname scale_colour_weca_d
scale_color_weca_d <- scale_colour_weca_d

#' Discrete fill scale using a WECA qualitative or sequential palette
#'
#' @inheritParams scale_colour_weca_d
scale_fill_weca_d <- function(palette = "qualitative", direction = 1, ...) {
  colours <- weca_palette(palette, direction = direction)
  ggplot2::scale_fill_manual(values = colours, ...)
}

#' Continuous colour scale using a WECA sequential or diverging palette
#'
#' @param palette   Name of a WECA continuous palette.
#' @param direction 1 = normal, -1 = reversed.
#' @param ...       Passed to ggplot2::scale_colour_gradientn().
scale_colour_weca_c <- function(palette = "continuous_green", direction = 1, ...) {
  stops <- WECA_PALETTES[[palette]]
  if (is.null(stops)) stop("Palette '", palette, "' not found.")
  if (direction == -1) stops <- rev(stops)
  ggplot2::scale_colour_gradientn(colours = stops, ...)
}

#' @rdname scale_colour_weca_c
scale_color_weca_c <- scale_colour_weca_c

#' Continuous fill scale using a WECA sequential or diverging palette
#'
#' @inheritParams scale_colour_weca_c
scale_fill_weca_c <- function(palette = "continuous_green", direction = 1, ...) {
  stops <- WECA_PALETTES[[palette]]
  if (is.null(stops)) stop("Palette '", palette, "' not found.")
  if (direction == -1) stops <- rev(stops)
  ggplot2::scale_fill_gradientn(colours = stops, ...)
}

#' Binned fill scale for class-interval choropleth maps
#'
#' Produces a discrete-looking stepped scale from a continuous WECA palette.
#'
#' @param palette   Name of a WECA continuous palette.
#' @param n_breaks  Number of break intervals (default 5).
#' @param direction 1 = normal, -1 = reversed.
#' @param ...       Passed to ggplot2::scale_fill_stepsn().
scale_fill_weca_b <- function(palette = "continuous_green", n_breaks = 5,
                               direction = 1, ...) {
  stops <- WECA_PALETTES[[palette]]
  if (is.null(stops)) stop("Palette '", palette, "' not found.")
  if (direction == -1) stops <- rev(stops)
  ggplot2::scale_fill_stepsn(colours = stops, n.breaks = n_breaks, ...)
}

#' @rdname scale_fill_weca_b
scale_colour_weca_b <- function(palette = "continuous_green", n_breaks = 5,
                                 direction = 1, ...) {
  stops <- WECA_PALETTES[[palette]]
  if (is.null(stops)) stop("Palette '", palette, "' not found.")
  if (direction == -1) stops <- rev(stops)
  ggplot2::scale_colour_stepsn(colours = stops, n.breaks = n_breaks, ...)
}

# Display helpers -------------------------------------------------------------

#' Display a single WECA palette as a colour strip
#'
#' @param name      Palette name.
#' @param n         For continuous palettes, number of steps to render (default 200).
#' @param direction 1 = normal, -1 = reversed.
show_weca_palette <- function(name, n = 200, direction = 1) {
  if (name %in% .WECA_CONTINUOUS) {
    colours <- weca_palette(name, n = n, direction = direction)
  } else {
    colours <- weca_palette(name, direction = direction)
  }
  n_cols <- length(colours)
  graphics::image(
    seq_len(n_cols), 1, as.matrix(seq_len(n_cols)),
    col = colours, axes = FALSE, xlab = "", ylab = ""
  )
  graphics::title(main = name, cex.main = 0.9)
}

#' Display all WECA palettes in a grid
#'
#' @param type "discrete", "continuous", or "all" (default).
show_weca_palettes <- function(type = "all") {
  nms <- switch(type,
    discrete   = .WECA_DISCRETE,
    continuous = .WECA_CONTINUOUS,
    all        = names(WECA_PALETTES)
  )

  n_pals <- length(nms)
  old_par <- graphics::par(
    mfrow = c(n_pals, 1),
    mar   = c(0.3, 14, 0.3, 0.3),
    oma   = c(1, 0, 2, 0)
  )
  on.exit(graphics::par(old_par))

  for (nm in nms) {
    cols <- if (nm %in% .WECA_CONTINUOUS) {
      weca_palette(nm, n = 200)
    } else {
      WECA_PALETTES[[nm]]
    }
    n_cols <- length(cols)
    graphics::image(
      seq_len(n_cols), 1, as.matrix(seq_len(n_cols)),
      col = cols, axes = FALSE, xlab = "", ylab = ""
    )
    graphics::mtext(nm, side = 2, las = 1, cex = 0.65, line = 0.3)
    graphics::box()
  }
  graphics::mtext("WECA Data Visualisation Palettes", outer = TRUE,
                  cex = 1.1, line = 0.5)
}

#' Display administrative area colour mappings
#'
#' Shows the fixed colour assigned to each UA, MCA, and national level.
show_weca_areas <- function() {
  all_areas <- list(
    "UA colours"       = WECA_UA_COLOURS,
    "MCA colours"      = WECA_MCA_COLOURS,
    "National colours" = WECA_NATIONAL_COLOURS
  )

  n_total <- sum(lengths(all_areas))
  old_par <- graphics::par(
    mfrow = c(n_total, 1),
    mar   = c(0.2, 16, 0.2, 0.5),
    oma   = c(1, 0, 2.5, 0)
  )
  on.exit(graphics::par(old_par))

  for (group in names(all_areas)) {
    cols <- all_areas[[group]]
    for (i in seq_along(cols)) {
      graphics::image(
        1, 1, as.matrix(1),
        col = cols[i], axes = FALSE, xlab = "", ylab = ""
      )
      graphics::mtext(names(cols)[i], side = 2, las = 1, cex = 0.7,
                      line = 0.3, col = "#1F1F1F")
      graphics::box(col = "#cccccc", lwd = 0.5)
    }
  }

  graphics::mtext("WECA Administrative Area Colours",
                  outer = TRUE, cex = 1.1, line = 1.2,
                  col = "#1D4F2B", font = 2)
}

# Convenience pre-built vectors -----------------------------------------------

weca_green  <- WECA_PALETTES[["sequential_green"]]
weca_purple <- WECA_PALETTES[["sequential_purple"]]
weca_claret <- WECA_PALETTES[["sequential_claret"]]
weca_qual   <- WECA_PALETTES[["qualitative"]]
weca_div_gc <- WECA_PALETTES[["diverging_green_claret_7"]]
weca_div_gp <- WECA_PALETTES[["diverging_green_purple_7"]]
