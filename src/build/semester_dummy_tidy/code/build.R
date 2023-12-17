main <- function(){
  semester_data_1 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_1.csv")) %>%
    make_first_row_colnames() %>%
    convert_to_char() %>%
    remove_colomn("Y")

  colnames <- c("unitid","instnm", "semester", "quarter", "year", "Y")

  semester_data_2 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_2.csv")) %>%
    set_colnames(colnames) %>%
    convert_to_char() %>%
    remove_colomn("Y")

  semester_data <- semester_data_2 %>%
    dplyr::bind_rows(semester_data_1, .)
}

make_first_row_colnames <- function(df){
  new_colnames <- df[1,] %>% unlist(., use.names=FALSE)
  df %>% 
    dplyr::rename_with(., ~ new_colnames) %>%
    dplyr::slice(-1) %>%
    return()
}

convert_to_char <- function(df) {
  df %>% dplyr::mutate(across(everything(), as.character)) %>% return()
}

set_colnames <- function(df, colnames){
  df %>% dplyr::rename_with(., ~ colnames) %>% return()
}

remove_colomn <- function(df, colname) {
  df %>% dplyr::select(-{{colname}}) %>% return()
}

box::use(functions/basics)
main()
