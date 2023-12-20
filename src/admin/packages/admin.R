main <- function(){
  install.packages(dev_dependencies_list())
  install.packages(dependencies_list())
  renv::restore()
}


dependencies_list <- function(){
  lists <- c("tidyverse")
  return(lists)
}
dev_dependencies_list <- function(){
  lists <- c("renv", "devtools", "box")
  return(lists)
}

main()
