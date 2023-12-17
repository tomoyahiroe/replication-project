#' @export
get_absolute_path = function(path) {
## recieve a path from repository root, and return the absolute path
 #
 # @var path string
 # @return string
 ##
  return( here::here(path) )
}

#' @export
load_packages <- function( ... ) {
## get variadic arugments and load the packages
 #
 # @var ... string  
 # @return none
 #
 ##
  pacman::p_load( ... )
}

#' @export
save_interim <- function(data, folder_name, extension){
  file_path <- gen_file_path_interim(folder_name, extension)
  saveRDS(data, file_path)
}

#' @export
read_interim <- function(folder_name, extension){
  file_path <- gen_file_path_interim(folder_name, extension)
  data <- readRDS(file_path)
  return(data)
}

#' @export
gen_file_path_interim <- function(folder_name, extension){
  if (missing(extension)){
    file_path0 <- folder_name
  } else{
    file_path0 <- paste0(folder_name, "_", extension)
  }
  file_name <- paste0(file_path0, ".rds")
  file_path <- here::here("src/build",file_path0,"output",file_name)
  return(file_path)
}

#' @export
save_my_plot <- function(my_plot, var_name, folder_name){
  var_name <- rlang::enquo(var_name)
  my_plot
  
  golden_ratio <- 1.618
  size1 <- 11
  size2 <- size1*golden_ratio
  my_unit = "cm"
  
  pdf_name <- paste0(var_name, ".pdf")
  png_name <- paste0(var_name, ".png")
  save_path <- here::here('analyze', folder_name, 'figure')
  
  var_id <- 2
  ggplot2::ggsave(pdf_name[var_id],
         width = size2, height = size1, unit = my_unit,
         path = save_path)
  ggplot2::ggsave(png_name[var_id],
         width = size2, height = size1, unit = my_unit,
         dpi = "print",
         path = save_path)
  
  while (!is.null(grDevices::dev.list()))  grDevices::dev.off()
  
}
