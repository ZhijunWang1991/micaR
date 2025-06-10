#' Custom ggplot2 Color Scale using micar Palette
#'
#' Applies a discrete or continuous color scale using a predefined micar color palette.
#'
#' @param palette Name of the palette to use: "blue", "red", "purple", "gray".
#' @param discrete Logical. Whether the scale is discrete (default: TRUE).
#' @param reverse Logical. Whether to reverse the color direction.
#' @param ... Other arguments passed to the underlying scale function.
#'
#' @return A ggplot2 scale object.
#' @importFrom ggplot2 scale_fill_manual scale_fill_gradientn
#' @export
scale_color_micar <- function(palette = "blue", discrete = TRUE, reverse = FALSE, ...) {
  pal <- micar_palette(palette)
  if (reverse) pal <- rev(pal)

  if (discrete) {
    ggplot2::scale_color_manual(values = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colors = pal, ...)
  }
}
