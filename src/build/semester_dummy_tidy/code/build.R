## Build semester dummy tidy data
##
## - Read in semester dummy data
## - Convert to tidy format
## - Merge into one data frame
## - Save as RDA file

main <- function(){
  semester_data_1 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_1.csv")) %>%
    make_first_row_colnames() %>%
    df_modules$convert_to_double(c("unitid", "year", "semester", "quarter", "Y"))

  colnames <- colnames(semester_data_1)

  semester_data_2 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_2.csv")) %>%
    df_modules$set_column_names(colnames)

  semester_dummy_data <- semester_data_2 %>%
    dplyr::bind_rows(semester_data_1, .) %>%
    df_modules$remove_colomn("Y")

  save(semester_dummy_data, file = basics$get_absolute_path("src/build/semester_dummy_tidy/output/semester_dummy_data.rda"))

}

make_first_row_colnames <- function(df){
  new_colnames <- df[1,] %>% unlist(., use.names=FALSE)
  df %>% 
    dplyr::rename_with(., ~ new_colnames) %>%
    dplyr::slice(-1) %>%
    return()
}


box::use(functions/basics)
box::use(functions/df_modules)
main()
