# 運動神経Xのカーネル密度を作成

main <- function() {
  load(basics$get_absolute_path("src/analyze/output/data/simulate_dataset.rda"))

kernel_density <- ggplot2::ggplot(simulate_dataset, ggplot2::aes(x=X)) +
  ggplot2::geom_line(stat = "density", adjust=.1, colour="red") +
  ggplot2::geom_line(stat = "density", color="black") +
  ggplot2::geom_line(stat = "density", adjust=10, colour="blue") +
  ggplot2::ggtitle("Kernel Density Plot(band width 0.1, default, 10)") +
  ggplot2::theme(text = ggplot2::element_text(size=80)) +
  ggplot2::xlab("運動神経X") +
  ggplot2::ylab("Density") 



  save_path <- basics$get_absolute_path("src/analyze/output/figure/")
  
  ggplot2::ggsave(filename = "kernel_density.png", plot = kernel_density, path = save_path, 
		  dpi = 320, device = "png")
}

box::use(functions/basics)
box::use(functions/df_modules)
box::use(functions/plot_modules)
main()
