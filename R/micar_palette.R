#' Get a Micar Color Palette
#'
#' @param palette One of "nature", "cell", or "bw"
#' @param n Number of colors to return (optional)
#' @param reverse Reverse the color order
#'
#' @return A character vector of HEX color codes
#' @export
micar_palette <- function(palette = "nature", n = NULL, reverse = FALSE) {
  palettes <- list(
    nature = c("#E64B35", "#4DBBD5", "#00A087", "#3C5488", "#F39B7F", "#8491B4"),
    cell   = c("#1F78B4", "#33A02C", "#6A3D9A", "#B2DF8A", "#A6CEE3", "#CAB2D6"),
    bw     = gray.colors(8, start = 0.2, end = 0.8)
  )

  pal <- palettes[[palette]]
  if (is.null(pal)) stop("Unknown palette name.")

  if (!is.null(n)) pal <- pal[seq_len(n)]

  if (reverse) pal <- rev(pal)
  return(pal)
}
