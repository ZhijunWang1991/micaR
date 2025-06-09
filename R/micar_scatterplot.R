micar_scatterplot <- function(data, x, y, color = NULL, shape = NULL, title = NULL) {
  library(ggplot2)
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  color <- rlang::enquo(color)
  shape <- rlang::enquo(shape)

  p <- ggplot(data, aes(x = !!x, y = !!y))
  if (!rlang::quo_is_null(color)) {
    p <- p + aes(color = !!color)
  }
  if (!rlang::quo_is_null(shape)) {
    p <- p + aes(shape = !!shape)
  }
  p <- p + geom_point(size = 3) +
    micar_theme() +
    scale_color_micar() +
    labs(title = title, x = NULL, y = NULL) +
    theme(legend.position = ifelse(rlang::quo_is_null(color) && rlang::quo_is_null(shape), "none", "right"))
  p
}
