#' Custom Legend Theme
#'
#' @param position Legend position.
#' @param title Title of the legend.
#'
#' @return A ggplot2 theme modification.
#' @export
micar_legend <- function(position = "right", title = "legend") {
  ggplot2::theme(
    legend.position = position,
    legend.title = ggplot2::element_text(text = title, size = 12, face = "bold"),
    legend.text = ggplot2::element_text(size = 10)
  )
}
