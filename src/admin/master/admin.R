# The entry point of the project
main <- function(){
}

make_first_row_colnames <- function(df){
  new_colnames <- df[1,] %>% unlist(., use.names=FALSE)
  df <- df %>% 
    dplyr::rename_with(., ~ new_colnames) %>%
    dplyr::slice(-1) %>%
    return()
}

semester_data_1 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_1.csv")) %>%
  make_first_row_colnames() %>%
  dplyr::mutate(unitid = as.double(unitid) ) %>%
  dplyr::mutate(semester = as.double(semester) ) %>%
  dplyr::mutate(quarter = as.double(quarter) ) %>%
  dplyr::mutate(year = as.double(year) ) %>%
  .[,-6]

semester_data_2 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_2.csv")) %>%
  .[-1,] %>% .[,-6]

semester_data <- semester_data_2 %>%
  dplyr::rename_with(., ~ c("unitid","instnm", "semester", "quarter", "year") ) %>%
  dplyr::bind_rows(semester_data_1, .)

box::use(functions/basics)
# main()
