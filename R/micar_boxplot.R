micar_boxplot <- function(data, x, y, fill = NULL, title = NULL) {
  library(ggplot2)
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  fill <- rlang::enquo(fill)

  p <- ggplot(data, aes(x = !!x, y = !!y))
  if (!rlang::quo_is_null(fill)) {
    p <- p + aes(fill = !!fill)
  }
  p <- p + geom_boxplot(outlier.color = "red", outlier.size = 2, color = "black") +
    micar_theme() +
    scale_fill_micar() +
    labs(title = title, x = NULL, y = NULL) +
    theme(legend.position = ifelse(rlang::quo_is_null(fill), "none", "right"))
  p
}
