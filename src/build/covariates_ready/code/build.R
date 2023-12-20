## build the covariates ready data
##
## - load covariates_data and gradrate_ready_dat, semester_data
## - filter covariates_data by year and unitid that are in gradrate_ready_data and semester_data
## - Save as RDA file

main <- function(){
  load(basics$get_absolute_path("src/build/covariates_tidy/output/covariates_data.rda")) # load covariates_data
  load(basics$get_absolute_path("src/build/gradrate_ready/output/gradrate_ready_data.rda")) # load gradrate_ready_data
  load(basics$get_absolute_path("src/build/semester_dummy_tidy/output/semester_data.rda")) # load semester_dummy_data

  # get the duplicated year list
  duplicated_year_list <- unique(append(gradrate_ready_data$year, semester_data$year))
  year_duration <- min(duplicated_year_list):max(duplicated_year_list)

  # get the unitid list
  unitid_list <- unique(gradrate_ready_data$unitid)

  covariates_ready_data <- covariates_data %>% 
    dplyr::filter(year %in% year_duration) %>%
    dplyr::filter(unitid %in% unitid_list)

  save(covariates_ready_data, file = basics$get_absolute_path("src/build/covariates_ready/output/covariates_ready_data.rda"))
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
