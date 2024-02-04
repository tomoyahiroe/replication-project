main <- function(){
  set_error_to_English()
  prepare_packages()
  prepare_japanese()
}

set_error_to_English <- function(){
  Sys.setenv(LANG = "en_US.UTF-8") 
}

prepare_packages <- function(){
  renv::restore()
  #devtools::update_packages(packages = TRUE)
  library(magrittr)
  library(here)
  # tinytex::install_tinytex()
  ggplot2::theme_set(ggplot2::theme_light())
  options(box.path = here::here("src/admin"))
}

prepare_japanese <- function() {
  ## Loading Google fonts (https://fonts.google.com/)
  sysfonts::font_add_google("Gochi Hand", "gochi")
  sysfonts::font_add_google("Schoolbell", "bell")

  ## Automatically use showtext to render text
  showtext::showtext_auto()
}

main()
