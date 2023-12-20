## build the gradrate tidy data
##
## - Read in gradrate data from multipul files
## - Merge into one data frame
## - Add a column "w_4yrgrads" to the data frame
## - Culculate percentage of woman_gradrate_4yr
## - Save as RDA file

main <- function(){
  data_folder_path <- basics$get_absolute_path("data/raw-data/semester_dummy/outcome/")
  target_files <- list.files(data_folder_path, pattern = ".xlsx", full.name = TRUE)

  gradrate_data <- target_files %>%
    purrr::map_df(readxl::read_excel) %>%
    df_modules$convert_to_double(c("totcohortsize","m_4yrgrads")) %>%
    dplyr::mutate(w_4yrgrads = tot4yrgrads - m_4yrgrads) %>%
    dplyr::mutate(women_gradrate_4yr = women_gradrate_4yr * 0.01)

  save(gradrate_data, file = basics$get_absolute_path("src/build/gradrate_tidy/output/gradrate_data.rda"))
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
