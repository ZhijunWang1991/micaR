% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_fill_micar.R
\name{scale_fill_micar}
\alias{scale_fill_micar}
\title{Custom ggplot2 Fill Scale using micar Palette}
\usage{
scale_fill_micar(palette = "blue", discrete = TRUE, reverse = FALSE, ...)
}
\arguments{
\item{palette}{Name of the palette to use: "blue", "red", "purple", "gray".}

\item{discrete}{Logical. Whether the scale is discrete (default: TRUE).}

\item{reverse}{Logical. Whether to reverse the color direction.}

\item{...}{Other arguments passed to the underlying scale function.}
}
\value{
A ggplot2 scale object.
}
\description{
Applies a discrete or continuous fill scale using a predefined micar color palette.
}
