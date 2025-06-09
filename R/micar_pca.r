#' PCA Plot
#'
#' Performs Principal Component Analysis (PCA) and returns a ggplot2-based PCA scatter plot.
#'
#' @param data A data.frame or tibble containing only numeric variables.
#' @param group_var Optional. A grouping variable (factor or character vector) of the same length as the number of rows in \code{data}.
#' @param scale Logical. Should the variables be scaled? Default is \code{TRUE}.
#' @param ellipse Logical. Should 95% confidence ellipses be drawn for groups? Default is \code{TRUE}.
#'
#' @return A \code{ggplot2} object representing the PCA scatter plot.
#'
#' @examples
#' iris_numeric <- iris[, 1:4]
#' group <- iris$Species
#' micar_pca(iris_numeric, group_var = group)
#'
#' @export
micar_pca <- function(data, group_var = NULL, scale = TRUE, ellipse = TRUE) {
  if (!is.data.frame(data)) stop("Input must be a data frame")

  numeric_data <- data |> dplyr::select(where(is.numeric))

  pca_res <- stats::prcomp(numeric_data, scale. = scale)
  scores <- as.data.frame(pca_res$x[, 1:2])
  colnames(scores) <- c("PC1", "PC2")

  if (!is.null(group_var)) {
    if (length(group_var) != nrow(scores)) stop("Length of group_var must match number of rows in data.")
    scores$Group <- as.factor(group_var)
  } else {
    scores$Group <- "All"
  }

  var_exp <- summary(pca_res)$importance[2, 1:2] * 100

  p <- ggplot2::ggplot(scores, ggplot2::aes(x = PC1, y = PC2, color = Group)) +
    ggplot2::geom_point(size = 3, alpha = 0.8) +
    ggplot2::labs(
      x = paste0("PC1 (", round(var_exp[1], 1), "%)"),
      y = paste0("PC2 (", round(var_exp[2], 1), "%)"),
      color = NULL
    ) +
    ggplot2::theme_minimal(base_size = 14) +
    ggplot2::theme(
      legend.position = "right",
      panel.grid = ggplot2::element_line(color = "grey90")
    )

  if (ellipse && !is.null(group_var)) {
    p <- p + ggplot2::stat_ellipse(ggplot2::aes(group = Group), level = 0.95)
  }

  return(p)
}
