main <- function(){
  pacman::p_load(dependencies_list(), character.only = TRUE)
  renv::restore()
}


dependencies_list <- function(){
  lists <- c("pacman", "renv", "tidyverse", "box", "skimr", "gtsummary", "rstatix", "janitor", "scales", "flextable", "showtext", "ggplot2", "gridExtra", "modelsummary", "quantreg") 
  return(lists)
}

main()
