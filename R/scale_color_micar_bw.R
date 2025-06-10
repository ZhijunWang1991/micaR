#' Black-and-White ggplot2 Color Scale for micar Palette
#'
#' Provides a black-and-white (grayscale) color scale for discrete or continuous data.
#'
#' @param discrete Logical. Use discrete scale? Default TRUE.
#' @param reverse Logical. Reverse the palette? Default FALSE.
#' @param ... Additional parameters passed to `scale_color_manual` or `scale_color_gradientn`.
#'
#' @return A ggplot2 color scale.
#'
#' @importFrom ggplot2 scale_color_manual scale_color_gradientn
#' @export
scale_color_micar_bw <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- c("#000000", "#666666", "#CCCCCC")  # 黑、深灰、浅灰

  if (reverse) pal <- rev(pal)

  if (discrete) {
    ggplot2::scale_color_manual(values = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colors = pal, ...)
  }
}
