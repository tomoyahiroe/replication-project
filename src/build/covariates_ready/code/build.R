## build the covariates ready data
##
## - load covariates_data
## - Save as RDA file

main <- function(){
  load(basics$get_absolute_path("src/build/covariates_tidy/output/covariates_data.rda")) # load covariates_data

  covariates_ready_data <- covariates_tidy %>%

  save(covariates_ready_data, file = basics$get_absolute_path("src/build/covariates_ready/output/covariates_ready_data.rda"))
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
