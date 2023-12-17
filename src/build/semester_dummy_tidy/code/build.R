main <- function(){
  semester_data_1 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_1.csv")) %>%
    make_first_row_colnames() %>%
    dplyr::mutate(unitid = as.double(unitid)) %>%
    dplyr::mutate(semester = as.double(semester)) %>%
    dplyr::mutate(quarter = as.double(quarter)) %>%
    dplyr::mutate(year = as.double(year)) %>%
    dplyr::mutate(Y = as.double(Y))

  colnames <- colnames(semester_data_1)

  semester_data_2 <- readr::read_csv(basics$get_absolute_path("data/raw-data/semester_dummy/semester_data_2.csv")) %>%
    set_column_names(colnames)

  semester_data <- semester_data_2 %>%
    dplyr::bind_rows(semester_data_1, .) %>%
    remove_colomn("Y")

  save(semester_data, file = basics$get_absolute_path("src/build/semester_dummy_tidy/output/semester_data.rda"))

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

# convert_character_to_double <- function(df, colname) {
#   df %>% dplyr::mutate({{ colname }} = as.double({{ colname }}, na.rm = TRUE)) %>% return()
# }

set_column_names<- function(df, colnames){
  df %>% dplyr::rename_with(., ~ colnames) %>% return()
}

remove_colomn <- function(df, colname) {
  df %>% dplyr::select(-{{colname}}) %>% return()
}

box::use(functions/basics)
main()
