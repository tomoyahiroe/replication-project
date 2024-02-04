# 収入Zの分位回帰

main <- function() {
  load(basics$get_absolute_path("src/analyze/output/data/simulate_dataset.rda"))


  # 平均に関する最小二乗法
  lm_mean <- lm(Z ~ X, data = simulate_dataset)

  # 分位回帰
  rq_median <- quantreg::rq(Z ~ X, data = simulate_dataset, tau = 0.5)
  rq_quarter_1 <- quantreg::rq(Z ~ X, data = simulate_dataset, tau = 0.25)
  rq_quarter_3 <- quantreg::rq(Z ~ X, data = simulate_dataset, tau = 0.75)

  # 要約結果の取得
  summary_lm <- summary(lm_mean)
  summary_rq_median <- summary(rq_median)
  summary_rq_quarter_1 <- summary(rq_quarter_1)
  summary_rq_quarter_3 <- summary(rq_quarter_3)

  # 結果を一つの表にまとめる
  result_table <- data.frame(
	Model = c("Simple Linear Regression", "Quantile Regression (Median)", "Quantile Regression (Q1)", 
		  "Quantile Regression (Q3)"),
	Coefficient = c(summary_lm$coefficients[2],
			summary_rq_median$coefficients[2],
			summary_rq_quarter_1$coefficients[2],
			summary_rq_quarter_3$coefficients[2]),
	Intercept = c(summary_lm$coefficients[1],
			summary_rq_median$coefficients[1],
			summary_rq_quarter_1$coefficients[1],
			summary_rq_quarter_3$coefficients[1]))

# 結果の保存
  sink("src/analyze/output/table/quantile_regression_table.tex")
  knitr::kable(result_table, format = "latex")
  sink()

}

box::use(functions/basics)
box::use(functions/df_modules)
box::use(functions/plot_modules)
main()
