## master.csv をさらに整形していく
##
## - unitidが同一の行は、instnmを全て同一の文字列にする

main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/master/output/master.csv"))

  data <- data %>%
    dplyr::group_by(unitid) %>%
    dplyr::mutate(instnm = dplyr::first(instnm)) %>%
    dplyr::ungroup() %>%
    dplyr::select(-c(...1))


  write.csv(data, file = basics$get_absolute_path("src/build/table_1/output/intermediate.csv"))
  

}

box::use(functions/basics)
box::use(functions/df_modules)
main()
