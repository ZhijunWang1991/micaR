#' micar_palette
#'
#' Returns a named color palette used in micaR plots.
#'
#' @param name Name of the color theme: one of "blue", "red", "purple", "gray".
#'
#' @return A character vector of 3 colors: low, mid, high for gradient scales.
#'
#' @export
micar_palette <- function(name = "blue") {
  palettes <- list(
    blue   = c("#2166AC", "#F7F7F7", "#B2182B"),
    red    = c("#B2182B", "#F7F7F7", "#2166AC"),
    purple = c("#762A83", "#F7F7F7", "#1B7837"),
    gray   = c("#000000", "#F7F7F7", "#CCCCCC")
  )

  if (!name %in% names(palettes)) {
    stop("Invalid palette name. Choose from: ", paste(names(palettes), collapse = ", "))
  }

  return(palettes[[name]])
}
