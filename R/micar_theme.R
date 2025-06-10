#' MicaR ggplot2 Theme for Publication
#'
#' A custom ggplot2 theme designed for publication-ready scientific figures,
#' inspired by the aesthetics of journals such as Nature. It provides
#' minimalist styling with options to control base font size and family.
#'
#' @param base_size Base font size. Default is \code{14}.
#' @param base_family Base font family. Default is \code{"sans"}.
#'
#' @return A ggplot2 theme object.
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
#' p + micar_theme()
#'
#' @importFrom ggplot2 theme_bw theme element_text element_blank element_line element_rect %+replace%
#' @export
micar_theme <- function(base_size = 14, base_family = "sans") {
  ggplot2::theme_bw(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.title = ggplot2::element_text(size = base_size + 2, face = "bold", hjust = 0.5),
      axis.title = ggplot2::element_text(size = base_size, face = "bold"),
      axis.text = ggplot2::element_text(size = base_size - 1, color = "black"),
      axis.ticks = ggplot2::element_line(color = "black"),
      panel.grid.major = ggplot2::element_line(color = "grey85"),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border = ggplot2::element_rect(color = "black", fill = NA),
      legend.title = ggplot2::element_text(size = base_size, face = "bold"),
      legend.text = ggplot2::element_text(size = base_size - 1),
      legend.key = ggplot2::element_blank(),
      legend.background = ggplot2::element_blank()
    )
}
