#' MicaR Barplot with Optional Error Bars
#'
#' Draw a publication-ready barplot using ggplot2 with optional error bars,
#' fill grouping, and theme styling. Designed for scientific publishing.
#'
#' @param data A data.frame
#' @param x Column name for x-axis (categorical)
#' @param y Column name for y-axis (numeric height of bars)
#' @param fill Optional fill aesthetic (group)
#' @param error_lower Column name for lower error bound (optional)
#' @param error_upper Column name for upper error bound (optional)
#' @param dodge Whether to use grouped barplot (TRUE/FALSE)
#' @param title Plot title
#' @param legend.position Legend position ("right", "bottom", "none", etc.)
#'
#' @return A ggplot object
#' @export
#' @import ggplot2
#' @importFrom rlang enquo quo_is_null
micar_barplot <- function(data, x, y, fill = NULL,
                          error_lower = NULL, error_upper = NULL,
                          dodge = FALSE,
                          title = NULL,
                          legend.position = "right") {

  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  fill <- rlang::enquo(fill)
  error_lower <- rlang::enquo(error_lower)
  error_upper <- rlang::enquo(error_upper)

  p <- ggplot(data, aes(x = !!x, y = !!y))

  has_fill <- !rlang::quo_is_null(fill)
  has_error <- !rlang::quo_is_null(error_lower) && !rlang::quo_is_null(error_upper)

  if (has_fill) {
    p <- p + aes(fill = !!fill)
    if (dodge) {
      p <- p + geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black")
      if (has_error) {
        p <- p + geom_errorbar(aes(ymin = !!error_lower, ymax = !!error_upper),
                               position = position_dodge(width = 0.8), width = 0.2)
      }
    } else {
      p <- p + geom_bar(stat = "identity", color = "black")
      if (has_error) {
        p <- p + geom_errorbar(aes(ymin = !!error_lower, ymax = !!error_upper), width = 0.2)
      }
    }
  } else {
    p <- p + geom_bar(stat = "identity", fill = "steelblue", color = "black")
    if (has_error) {
      p <- p + geom_errorbar(aes(ymin = !!error_lower, ymax = !!error_upper), width = 0.2)
    }
  }

  p +
    micar_theme() +
    scale_fill_micar() +
    labs(title = title, x = NULL, y = NULL, fill = NULL) +
    theme(legend.position = if (has_fill) legend.position else "none")
}
