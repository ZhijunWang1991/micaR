#' A Publication-Ready ggplot2 Theme Inspired by Nature Style
#'
#' @return A ggplot2 theme object.
#' @export
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
#'   geom_boxplot() +
#'   micar_theme()
#' print(p)

micar_theme <- function(base_size = 12, base_family = "sans") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.title = element_text(size = base_size * 1.4, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = base_size * 1.1, hjust = 0.5),
      axis.title = element_text(size = base_size * 1.2, face = "bold"),
      axis.text = element_text(size = base_size),
      axis.line = element_line(size = 0.8, color = "black"),
      axis.ticks = element_line(size = 0.6),
      panel.grid = element_blank(),
      panel.border = element_blank(),
      legend.title = element_text(size = base_size, face = "bold"),
      legend.text = element_text(size = base_size * 0.9),
      legend.key = element_rect(fill = "transparent", color = NA),
      legend.background = element_blank(),
      legend.position = "right",
      strip.background = element_blank(),
      strip.text = element_text(size = base_size * 1.1, face = "bold")
    )
}
