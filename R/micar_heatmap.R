#' micar_heatmap
#'
#' Generate a heatmap for a numeric matrix or data frame, with optional row grouping annotation.
#'
#' @param data A numeric matrix or data frame.
#' @param group Optional vector for row annotation (e.g., sample group).
#' @param scale Logical. Whether to scale rows. Default is TRUE.
#' @param cluster_rows Logical. Cluster rows? Default TRUE.
#' @param cluster_cols Logical. Cluster columns? Default TRUE.
#'
#' @return A heatmap plot using ComplexHeatmap.
#' @export
micar_heatmap <- function(data, group = NULL, scale = TRUE, cluster_rows = TRUE, cluster_cols = TRUE) {
  if (!requireNamespace("ComplexHeatmap", quietly = TRUE)) {
    stop("Please install the 'ComplexHeatmap' package.")
  }
  if (!is.matrix(data)) {
    data <- as.matrix(data)
  }

  if (scale) {
    data <- t(scale(t(data)))  # z-score rows
  }

  # 构建行注释（如果提供分组）
  row_anno <- if (!is.null(group)) {
    ComplexHeatmap::rowAnnotation(Group = as.factor(group))
  } else {
    NULL
  }

  ComplexHeatmap::Heatmap(
    data,
    name = "Z-score",
    cluster_rows = cluster_rows,
    cluster_columns = cluster_cols,
    top_annotation = NULL,
    right_annotation = row_anno,
    show_row_names = FALSE,
    show_column_names = TRUE,
    row_title = NULL,
    column_title = NULL
  )
}
