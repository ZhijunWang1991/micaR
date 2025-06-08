#' micar_theme
#'
#' A minimalist and publication-ready ggplot2 theme for scientific graphics.
#'
#' @param base_size Base font size. Default is 14.
#' @param base_family Base font family. Use a Chinese-safe font like "SimHei" or "Arial Unicode MS" if needed.
#'
#' @return A ggplot2 theme object.
#' @export
micar_theme <- function(base_size = 14, base_family = "") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      axis.title = ggplot2::element_text(face = "bold"),
      axis.text = ggplot2::element_text(color = "black"),
      panel.grid.major = ggplot2::element_line(color = "grey90"),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border = ggplot2::element_rect(color = "black", fill = NA, linewidth = 0.5),
      legend.title = ggplot2::element_text(face = "bold"),
      legend.position = "right",
      strip.background = ggplot2::element_rect(fill = "grey90", color = NA),
      strip.text = ggplot2::element_text(face = "bold")
    )
}
