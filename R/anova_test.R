anova_test <- function(data, response, group, tukey = TRUE) {
  if (!requireNamespace("dplyr", quietly = TRUE)) stop("请安装 dplyr 包")
  if (!requireNamespace("stats", quietly = TRUE)) stop("请安装 stats 包")

  # 构建公式
  formula <- as.formula(paste(response, "~", group))

  # 单因素方差分析
  fit <- aov(formula, data = data)

  # ANOVA 表
  anova_tab <- summary(fit)[[1]]

  # Tukey HSD 多重比较结果
  tukey_res <- NULL
  if (tukey) {
    tukey_hsd <- TukeyHSD(fit)
    # 假设只有一个因素，取第一个元素
    tukey_df <- as.data.frame(tukey_hsd[[1]])
    # 把行名（比较对）变成一列
    tukey_df$Comparison <- rownames(tukey_df)
    # 重排列
    tukey_df <- tukey_df[, c("Comparison", "diff", "lwr", "upr", "p adj")]
    tukey_res <- tukey_df
  }

  return(list(
    anova = anova_tab,
    tukey = tukey_res
  ))
}
