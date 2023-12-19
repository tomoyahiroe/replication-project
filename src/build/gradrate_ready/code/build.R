## build the covariates ready data
##
## - load gradrate_data
## - culculate gradrate of total and men
## - Convert the value to 3 significant digits

main <- function() {
  load(basics$get_absolute_path("src/build/gradrate_tidy/output/gradrate_data.rda")) # load covariates_data

  gradrate_ready_data <- gradrate_data %>%
    dplyr::mutate(tot_gradrate_4yr = tot4yrgrads / totcohortsize) %>%
    dplyr::mutate(men_gradrate_4yr = m_4yrgrads / m_cohortsize) %>%
    df_modules$convert_float_to_3digits(c("tot_gradrate_4yr", "men_gradrate_4yr", "women_gradrate_4yr")) %>%
    df_modules$remove_na_rows(c("tot_gradrate_4yr", "men_gradrate_4yr", "women_gradrate_4yr"))

  save(gradrate_ready_data, file = basics$get_absolute_path("src/build/gradrate_ready/output/gradrate_ready_data.rda"))
}



box::use(functions/basics)
box::use(functions/df_modules)
main()
