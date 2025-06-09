#' Discrete color scale using micar palettes
#'
#' @param palette Palette name (e.g., "nature")
#' @param reverse Reverse the color order
#' @param ... Other arguments to scale_color_manual
#' @export
scale_color_micar <- function(palette = "nature", reverse = FALSE, ...) {
  ggplot2::scale_color_manual(values = micar_palette(palette, reverse = reverse), ...)
}
