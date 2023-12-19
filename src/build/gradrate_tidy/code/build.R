## build the gradrate tidy data
##
## - Read in gradrate data from multipul files
## - Merge into one data frame
## - Save as RDA file

main <- function(){
  data_folder_path <- basics$get_absolute_path("data/raw-data/semester_dummy/outcome/")
  target_files <- list.files(data_folder_path, pattern = ".xlsx", full.name = TRUE)

  gradrate_data <- target_files %>%
    purrr::map_df(readxl::read_excel) %>%
    df_modules$convert_to_double(c("totcohortsize","m_4yrgrads"))

  save(gradrate_data, file = basics$get_absolute_path("src/build/gradrate_tidy/output/gradrate_data.rda"))
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
