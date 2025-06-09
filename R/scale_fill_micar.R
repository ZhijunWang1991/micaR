#' Discrete fill scale using micar palettes
#'
#' @param palette Palette name (e.g., "nature")
#' @param reverse Reverse the color order
#' @param ... Other arguments to scale_fill_manual
#' @export
scale_fill_micar <- function(palette = "nature", reverse = FALSE, ...) {
  ggplot2::scale_fill_manual(values = micar_palette(palette, reverse = reverse), ...)
}
