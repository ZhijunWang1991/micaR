micar_grouped_barplot <- function(data, x, y, group, title = NULL) {
  library(ggplot2)
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  group <- rlang::enquo(group)

  p <- ggplot(data, aes(x = !!x, y = !!y, fill = !!group)) +
    geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black") +
    micar_theme() +
    scale_fill_micar() +
    labs(title = title, x = NULL, y = NULL) +
    theme(legend.position = "right")
  p
}
