main <- function(){
  load(basics$get_absolute_path("src/analyze/output/data/simulate_dataset.rda"))
}

box::use(functions/basics)
box::use(functions/plot_modules)
box::use(functions/df_modules)
main()
