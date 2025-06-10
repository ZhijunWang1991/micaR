#' Boxplot
#'
#' Creates a boxplot.
#'
#' @param data Data frame.
#' @param x,y Variables for x and y axes.
#' @param fill Optional variable for fill color.
#' @param title Optional plot title.
#'
#' @return A ggplot2 object.
#' @export
micar_boxplot <- function(data, x, y, fill = NULL, title = NULL) {
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  fill <- rlang::enquo(fill)

  p <- ggplot2::ggplot(data, ggplot2::aes(x = !!x, y = !!y))
  if (!rlang::quo_is_null(fill)) {
    p <- p + ggplot2::aes(fill = !!fill)
  }

  p + ggplot2::geom_boxplot(color = "black") +
    ggplot2::labs(title = title, x = NULL, y = NULL)
}
