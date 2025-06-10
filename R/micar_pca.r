#' PCA Plot with ggplot2
#'
#' Performs Principal Component Analysis (PCA) on numeric columns
#' of a data frame and returns a scatter plot of the first two principal components.
#'
#' @param data A data frame or tibble containing numeric variables.
#' @param group_var Optional. A grouping variable (factor or character vector) of the same length as the number of rows in \code{data}.
#' @param scale Logical. Whether to scale variables to unit variance before PCA. Default is \code{TRUE}.
#' @param ellipse Logical. Whether to draw 95\% confidence ellipses for groups. Only applies when \code{group_var} is provided. Default is \code{TRUE}.
#'
#' @return A \code{ggplot} object showing a PCA scatter plot of PC1 vs. PC2.
#'
#' @examples
#' data(iris)
#' iris_numeric <- iris[, 1:4]
#' micar_pca(iris_numeric)
#' micar_pca(iris_numeric, group_var = iris$Species)
#' micar_pca(iris_numeric, group_var = iris$Species, scale = FALSE)
#'
#' @import ggplot2
#' @importFrom dplyr select_if
#' @importFrom stats prcomp
#' @export
micar_pca <- function(data, group_var = NULL, scale = TRUE, ellipse = TRUE) {
  # 输入验证
  if (!is.data.frame(data)) {
    stop("Input must be a data frame", call. = FALSE)
  }

  # 选择数值变量
  numeric_data <- dplyr::select_if(data, is.numeric)
  if (ncol(numeric_data) == 0) {
    stop("No numeric variables found in the data", call. = FALSE)
  }

  # 执行 PCA
  pca_res <- stats::prcomp(numeric_data, scale. = scale)

  # 提取前两个主成分得分
  scores <- as.data.frame(pca_res$x[, 1:2])
  colnames(scores) <- c("PC1", "PC2")

  # 添加分组变量
  if (!is.null(group_var)) {
    if (length(group_var) != nrow(scores)) {
      stop("Length of group_var must match number of rows in data.", call. = FALSE)
    }
    scores$Group <- as.factor(group_var)
  } else {
    scores$Group <- factor("All")
  }

  # 解释方差比例
  var_exp <- summary(pca_res)$importance[2, 1:2] * 100

  # 绘图
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

  # 椭圆
  if (ellipse && !is.null(group_var)) {
    p <- p + ggplot2::stat_ellipse(ggplot2::aes(group = Group), level = 0.95)
  }

  return(p)
}
