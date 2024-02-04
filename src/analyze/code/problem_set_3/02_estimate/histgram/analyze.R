# 運動神経Xのヒストグラムを作成

main <- function() {
  load(basics$get_absolute_path("src/analyze/output/data/simulate_dataset.rda"))

  hist1 <- plot_modules$plot_histogram(data = simulate_dataset, x = X, bin = 10, title = "bin = 1")
  hist2 <- plot_modules$plot_histogram(data = simulate_dataset, x = X, bin = 1, title = "bin = 0.1")
  hist3 <- plot_modules$plot_histogram(data = simulate_dataset, x = X, bin = 0.1, title = "bin = 0.01")

  grid_hist <- gridExtra::grid.arrange(hist1, hist2, hist3, nrow = 2)

  save_path <- basics$get_absolute_path("src/analyze/output/figure/")
  
  ggplot2::ggsave(filename = "grid_hist.png", plot = grid_hist, path = save_path, 
		  width = 16, height = 9, dpi = 320, device = "png")
}

box::use(functions/basics)
box::use(functions/df_modules)
box::use(functions/plot_modules)
main()
