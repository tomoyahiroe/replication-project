main <- function(){
  data_folder_path <- basics$get_absolute_path("data/raw-data/semester_dummy/outcome/")
  target_files <- list.files(data_folder_path, pattern = ".xlsx", full.name = TRUE)

  gradrate_data <- target_files %>%
    purrr::map_df(readr::read_csv)
}
box::use(functions/basics)
main()
