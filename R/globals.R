# globals.R
# This file silences R CMD check notes for non-standard evaluation (NSE) in ggplot2/dplyr
utils::globalVariables(c(
  "Var1", "Var2", "Correlation",
  "PC1", "PC2", "Group"
))
