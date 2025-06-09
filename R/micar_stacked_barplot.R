micar_stacked_barplot <- function(data, x, y, group, title = NULL) {
  library(ggplot2)
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  group <- rlang::enquo(group)

  p <- ggplot(data, aes(x = !!x, y = !!y, fill = !!group)) +
    geom_bar(stat = "identity", position = "stack", color = "black") +
    micar_theme() +
    scale_fill_micar() +
    labs(title = title, x = NULL, y = NULL) +
    theme(legend.position = "right")
  p
}
