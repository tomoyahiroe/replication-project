main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/table_1/output/intermediate.csv"))

  gradrate_trend <- tibble::tibble(years = data$year, gradrate4yr = data$gradrate4yr) %>%
    dplyr::group_by(years) %>%
    dplyr::summarize(mean = mean(gradrate4yr, na.rm = TRUE), sd = sd(gradrate4yr, na.rm = TRUE))

  save_path <- basics$get_absolute_path("src/analyze/output/figure/")

  plot <- ggplot2::ggplot(gradrate_trend, ggplot2::aes(x = years, y = mean)) +
		ggplot2::geom_line() +
		ggplot2::labs(title = "4-Year Graduation Rate", x = "Year", y = "4-Year Graduation Rate") +
		ggplot2::theme(panel.background = ggplot2::element_blank(), text = ggplot2::element_text(size = 24))

  ggplot2::ggsave(filename = "gradrate_trend.png", plot = plot, path = save_path, 
	  width = 16, height = 9, dpi = 320, device = "png")
  
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
