main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/table_1/output/intermediate.csv"))

  semester_trend <- data %>%
    dplyr::group_by(year) %>%
    dplyr::summarize(mean = mean(semester, na.rm = TRUE))

  save_path <- basics$get_absolute_path("src/analyze/output/figure/")

  plot <- ggplot2::ggplot(semester_trend, ggplot2::aes(x = year, y = mean)) +
		ggplot2::geom_line() +
		ggplot2::labs(title = "Fraction of schools on semesters", x = "Year", y = "Fraction of schools on semesters") +
		ggplot2::theme(panel.background = ggplot2::element_blank(), text = ggplot2::element_text(size = 24))

  ggplot2::ggsave(filename = "semester_trend.png", plot = plot, path = save_path, 
	  width = 16, height = 9, dpi = 320, device = "png")
  
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
