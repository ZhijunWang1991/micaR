#' Grouped barplot
#'
#' Creates a grouped barplot with bars grouped by a categorical variable.
#'
#' @param data A data frame.
#' @param x A character string for x-axis variable.
#' @param y A character string for y-axis variable.
#' @param group A character string for grouping variable (fill aesthetic).
#'
#' @inheritParams micar_barplot
#' @return A ggplot2 object.
#' @export
micar_grouped_barplot <- function(data, x, y, group, title = NULL) {
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  group <- rlang::enquo(group)

  ggplot2::ggplot(data, ggplot2::aes(x = !!x, y = !!y, fill = !!group)) +
    ggplot2::geom_bar(stat = "identity", position = "dodge", color = "black") +
    ggplot2::labs(title = title, x = NULL, y = NULL)
}
