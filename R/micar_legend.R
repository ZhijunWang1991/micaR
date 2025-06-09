#' Universal legend beautifier for ggplot2
#'
#' @param position Position of the legend: "top", "right", "bottom", "left"
#' @param base_size Base font size for legend text
#' @return A ggplot2 theme layer
#' @export
micar_legend <- function(position = "right", base_size = 12) {
  position <- match.arg(position, choices = c("top", "right", "bottom", "left"))

  if (position %in% c("top", "bottom")) {
    direction <- "horizontal"
    spacing <- ggplot2::unit(0.5, "cm")
  } else {
    direction <- "vertical"
    spacing <- ggplot2::unit(0.4, "cm")
  }

  ggplot2::theme(
    legend.position = position,
    legend.direction = direction,
    legend.title = ggplot2::element_text(size = base_size, face = "bold"),
    legend.text = ggplot2::element_text(size = base_size * 0.9),
    legend.key.height = spacing,
    legend.key.width = spacing,
    legend.margin = ggplot2::margin(4, 4, 4, 4),
    legend.box.margin = ggplot2::margin(5, 5, 5, 5)
  )
}
