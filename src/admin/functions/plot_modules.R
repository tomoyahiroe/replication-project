#' @export
plot_scatter <- function(data, x_col, y_col, x_label, y_label, title) {
## Function: plot_scatter
 # Description: This function creates a scatter plot
 # Arguments:
 #   data: A data frame
 #   x_col: A column name
 #   y_col: A column name
 #   x_label: A string
 #   y_label: A string
 #   title: A string
 # Returns:
 #   A ggplot2 object
 # Example:
 # > plot_scatter(data_inst_level, men_ratio_in_4yrgrads, mean_gradrate_4yr, "x", "y", "title")
 ##
  x = rlang::enquo(x_col)
  y = rlang::enquo(y_col)
  ggplot2::ggplot(data, ggplot2::aes(x = !!x, y = !!y)) +
		ggplot2::geom_point() +
		ggplot2::labs(title = title, x = x_label, y = y_label) +
		ggplot2::theme(panel.background = ggplot2::element_blank(), text = ggplot2::element_text(size = 12))
}

#' @export
plot_histogram <- function(data, x, bin, title) {
## Function: plot_histogram
 # Description: This function creates a histogram
 # Arguments:
 #   data: A data frame
 #   x: A column name
 #   bin: A number
 #   title: A string
 # Returns:
 #   A ggplot2 object
 # Example:
 # > plot_histogram(data_inst_level, 30, "title")
 ##
  X = rlang::enquo(x)
  ggplot2::ggplot(data, ggplot2::aes(x = !!X)) +
	  ggplot2::geom_histogram(binwidth = bin, fill = "skyblue", color = "black") +
	  ggplot2::labs(title = title, x = "x", y = "y") +
	  ggplot2::theme(panel.background = ggplot2::element_blank(), text = ggplot2::element_text(size = 12))
}

