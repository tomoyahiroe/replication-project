## Build master_data
##
## - Load covariates_ready_data, gradrate_ready_data, and semester_dummy_data

main <- function() {
  load(basics$get_absolute_path("src/build/covariates_ready/output/covariates_ready_data.rda")) # load covariates_ready_data
  load(basics$get_absolute_path("src/build/gradrate_ready/output/gradrate_ready_data.rda")) # load gradrate_ready_data
  load(basics$get_absolute_path("src/build/semester_dummy_tidy/output/semester_dummy_data.rda")) # load semester_dummy_data

  # merge covariates_ready_data and gradrate_ready_data, and semester_dummy_data by unitid and year
  master_data <- dplyr::left_join(covariates_ready_data, gradrate_ready_data, by = c("unitid", "year")) %>%
    dplyr::left_join(semester_dummy_data, by = c("unitid", "year")) %>%
    ## make white_cohort_rate by calculating (white_cohortsize / totcohortsize * 0.01) if totcohortsize > 0, otherwise NA
    dplyr::mutate(white_cohort_rate = ifelse(totcohortsize > 0, white_cohortsize / totcohortsize * 0.01, NA)) %>%
    df_modules$convert_float_to_3digits(c("white_cohort_rate")) # convert white_cohort_rate to 3 digits
  # save master_data
  write.csv(master_data, file = basics$get_absolute_path("src/build/master/output/master_data.csv"))
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
