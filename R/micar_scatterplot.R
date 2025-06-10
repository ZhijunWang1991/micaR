#' Scatter Plot
#'
#' Creates a scatter plot using ggplot2 with optional color grouping and title.
#'
#' @param data A data frame.
#' @param x A column name (unquoted) for the x-axis variable.
#' @param y A column name (unquoted) for the y-axis variable.
#' @param color Optional. A column name (unquoted) for grouping by color.
#' @param title Optional. Plot title as a string.
#'
#' @return A ggplot2 object.
#'
#' @examples
#' micar_scatterplot(iris, Sepal.Length, Sepal.Width, color = Species, title = "Sepal Size")
#'
#' @importFrom ggplot2 ggplot aes geom_point labs
#' @importFrom rlang enquo quo_is_null
#' @export
micar_scatterplot <- function(data, x, y, color = NULL, title = NULL) {
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  color <- rlang::enquo(color)

  p <- ggplot2::ggplot(data, ggplot2::aes(x = !!x, y = !!y))
  if (!rlang::quo_is_null(color)) {
    p <- p + ggplot2::aes(color = !!color)
  }

  p + ggplot2::geom_point(size = 3, alpha = 0.8) +
    ggplot2::labs(title = title, x = NULL, y = NULL)
}
