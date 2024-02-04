main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/table_1/output/intermediate.csv"))

  data_inst_level <- data %>%
    dplyr::group_by(unitid) %>%
    dplyr::summarize(
		     mean_gradrate_4yr = mean(gradrate4yr, na.rm = TRUE),
		     men_ratio_in_4yrgrads = mean(m_4yrgrads / tot4yrgrads, na.rm = TRUE),
		     women_ratio_in_4yrgrads = mean(w_4yrgrads / tot4yrgrads, na.rm = TRUE),
		     mean_white_cohort_rate = mean(per_white_cohort, na.rm = TRUE),
		     mean_costs = mean(costs, na.rm = TRUE),
		     mean_instate_tuition = mean(instatetuition, na.rm = TRUE),
    )

  save_path <- basics$get_absolute_path("src/analyze/output/figure/")

  plot_men_ratio <- plot_modules$plot_scatter(data_inst_level, men_ratio_in_4yrgrads, mean_gradrate_4yr, 
					      "Men's ratio in 4year graduation rate", "4year graduation rate", "4年卒業率と男子学生比率")
  plot_women_ratio <- plot_modules$plot_scatter(data_inst_level, women_ratio_in_4yrgrads, mean_gradrate_4yr, 
						"Women's ratio in 4year graduation rate", "4year graduation rate", "4年卒業率と女子学生比率")
  plot_white_cohort_rate <- plot_modules$plot_scatter(data_inst_level, mean_white_cohort_rate, mean_gradrate_4yr, 
						      "White Cohort rate", "4year graduation rate", "4年卒業率と白人学生割合")
  plot_mean_costs <- plot_modules$plot_scatter(data_inst_level, mean_costs, mean_gradrate_4yr, 
					       "Anual running costs", "4year graduation rate", "4年卒業率と年間運営コスト")
  plot_mean_instate_tuition <- plot_modules$plot_scatter(data_inst_level, mean_instate_tuition, mean_gradrate_4yr, 
							 "In-state tuition", "4year graduation rate", "4年卒業率と学費")

  grid_plots <- gridExtra::grid.arrange(plot_men_ratio, plot_women_ratio, plot_white_cohort_rate, 
					plot_mean_costs, plot_mean_instate_tuition, ncol = 2)

  ggplot2::ggsave(filename = "scatter_plots.png", plot = grid_plots, path = save_path, 
		  width = 9, height = 16, dpi = 320, device = "png")
}


box::use(functions/basics)
box::use(functions/df_modules)
box::use(functions/plot_modules)
main()
