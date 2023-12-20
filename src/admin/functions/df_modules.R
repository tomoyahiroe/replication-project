#' @export
convert_to_char <- function(tibble, colnames_vector) {
## convert type of columns to character type
 # 
 # @var df tibble
 # @var colnames_vector vector of column names
 # @return tibble
 ##  
  box::use(magrittr[`%>%`])
  tibble %>% dplyr::mutate(across(colnames_vector, as.character)) %>% return()
}

#' @export
convert_to_double <- function(df, colnames_vector) {
## convert type of columns to double type
 #
 # @var df tibble
 # @var colnames_vector vector of column names
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  df %>% dplyr::mutate(across(colnames_vector, as.double)) %>% return()
}

#' @export
set_column_names<- function(df, colnames_vector){
## set column names
 #
 # @var df tibble
 # @var colnames_vector vector of column names
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  df %>% dplyr::rename_with(., ~ colnames_vector) %>% return()
}

#' @export
change_column_name <- function(df, target_column, new_column_name){
## change column name
 #
 # @var df tibble
 # @var target_column character of target column name
 # @var new_column_name character of new column name
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  df %>% dplyr::rename(!!new_column_name := {{target_column}}) %>% return()
}

#' @export
remove_colomn <- function(df, colname) {
## remove column
 #
 # @var df tibble
 # @var colname character of column name you want to remove
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  df %>% dplyr::select(-{{colname}}) %>% return()
}

#' @export
convert_float_to_3digits <- function(df, colnames_vector) {
## convert values of columns to double type with 3 digits
 #
 # @var df tibble
 # @var colnames_vector vector of column names
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  # use round
  df %>% dplyr::mutate(across(all_of(colnames_vector), ~ round(., digits = 3))) %>% return()
  # df %>% dplyr::mutate(across(all_of(colnames_vector), ~ format(.,nsmall = 3))) %>% return()
}

#' @export
remove_na_rows <- function(df, colnames_vector) {
## remove rows with NA values
 #
 # @var df tibble
 # @var colnames_vector vector of column names
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  df %>% tidyr::drop_na(all_of(colnames_vector)) %>% return()
}

#' @export
convert_na_to_zero <- function(df, colnames_vector) {
## convert NA values to 0
 #
 # @var df tibble
 # @var colnames_vector vector of column names
 # @return tibble
 ##
  box::use(magrittr[`%>%`])
  df %>% dplyr::mutate(across(all_of(colnames_vector), ~ tidyr::replace_na(., "0"))) %>% return()
}
