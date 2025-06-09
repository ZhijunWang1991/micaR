micar_barplot <- function(data, x, y, fill = NULL,
                          error_lower = NULL, error_upper = NULL,
                          dodge = FALSE,
                          title = NULL) {
  library(ggplot2)
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  fill <- rlang::enquo(fill)
  error_lower <- rlang::enquo(error_lower)
  error_upper <- rlang::enquo(error_upper)

  p <- ggplot(data, aes(x = !!x, y = !!y))

  if (!rlang::quo_is_null(fill)) {
    p <- p + aes(fill = !!fill)
    if (dodge) {
      p <- p + geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black")
      if (!rlang::quo_is_null(error_lower) && !rlang::quo_is_null(error_upper)) {
        p <- p + geom_errorbar(aes(ymin = !!error_lower, ymax = !!error_upper),
                               position = position_dodge(width = 0.8), width = 0.2)
      }
    } else {
      p <- p + geom_bar(stat = "identity", color = "black")
      if (!rlang::quo_is_null(error_lower) && !rlang::quo_is_null(error_upper)) {
        p <- p + geom_errorbar(aes(ymin = !!error_lower, ymax = !!error_upper),
                               width = 0.2)
      }
    }
  } else {
    p <- p + geom_bar(stat = "identity", fill = "steelblue", color = "black")
    if (!rlang::quo_is_null(error_lower) && !rlang::quo_is_null(error_upper)) {
      p <- p + geom_errorbar(aes(ymin = !!error_lower, ymax = !!error_upper),
                             width = 0.2)
    }
  }

  p +
    micar_theme() +
    scale_fill_micar() +
    labs(title = title, x = NULL, y = NULL) +
    theme(legend.position = ifelse(rlang::quo_is_null(fill), "none", "right"))
}
