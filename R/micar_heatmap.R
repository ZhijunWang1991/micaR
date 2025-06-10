#' Heatmap of Correlation Matrix
#'
#' Computes the Pearson correlation matrix of numeric variables in the dataset and
#' plots a heatmap using ggplot2 with a publication-ready theme.
#'
#' @param data A data frame or tibble containing numeric variables.
#' @param palette Character. Color palette name. Options: "blue", "red", "purple", "gray". Default is "blue".
#' @param limits Numeric vector of length 2 specifying the range of correlation coefficients. Default is c(-1, 1).
#' @param cluster Logical. Whether to cluster rows and columns (default: FALSE).
#'
#' @return A \code{ggplot} object showing the correlation heatmap.
#'
#' @examples
#' micar_heatmap(iris[, 1:4])
#'
#' @importFrom stats cor dist hclust
#' @importFrom dplyr select where
#' @importFrom tidyr expand_grid pivot_longer
#' @importFrom ggplot2 ggplot aes geom_tile scale_fill_gradient2 labs theme_minimal theme element_text coord_fixed
#' @export
micar_heatmap <- function(data, palette = "blue", limits = c(-1, 1), cluster = FALSE) {
  numeric_data <- dplyr::select(data, where(is.numeric))
  cor_matrix <- cor(numeric_data, use = "pairwise.complete.obs")

  if (cluster) {
    hc <- hclust(dist(cor_matrix))
    order <- hc$order
    cor_matrix <- cor_matrix[order, order]
  }

  cor_df <- as.data.frame(as.table(cor_matrix))
  colnames(cor_df) <- c("Var1", "Var2", "Correlation")

  pal <- micar_palette(palette)

  ggplot(cor_df, aes(x = Var1, y = Var2, fill = Correlation)) +
    geom_tile(color = "white") +
    scale_fill_gradient2(low = pal[1], mid = pal[2], high = pal[3],
                         midpoint = 0, limit = limits, space = "Lab",
                         name = "Correlation") +
    coord_fixed() +
    labs(x = NULL, y = NULL) +
    theme_minimal(base_size = 14) +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      panel.grid = element_blank()
    )
}
