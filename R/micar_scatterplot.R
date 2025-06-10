#' Scatter Plot with Optional Grouping and Coloring
#'
#' Creates a scatter plot using ggplot2 with optional grouping for color aesthetics.
#'
#' @param data A data.frame containing the data.
#' @param x The x-axis variable (unquoted).
#' @param y The y-axis variable (unquoted).
#' @param color Optional grouping/coloring variable (unquoted). Default is NULL.
#' @param title Optional plot title.
#'
#' @return A ggplot2 object representing the scatter plot.
#' @import ggplot2
#' @importFrom rlang enquo quo_is_null !!
#' @export
micar_scatterplot <- function(data, x, y, color = NULL, title = NULL) {
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  color <- rlang::enquo(color)

  p <- ggplot2::ggplot(data, ggplot2::aes(x = !!x, y = !!y))

  if (!rlang::quo_is_null(color)) {
    p <- p + ggplot2::aes(color = !!color) +
      ggplot2::geom_point(size = 3, alpha = 0.8)
  } else {
    p <- p + ggplot2::geom_point(size = 3, alpha = 0.8, color = "steelblue")
  }

  p <- p +
    ggplot2::labs(title = title, x = NULL, y = NULL, color = NULL) +
    ggplot2::theme_minimal(base_size = 14) +
    ggplot2::theme(legend.position = ifelse(rlang::quo_is_null(color), "none", "right"))

  return(p)
}
