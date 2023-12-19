
## build the covariates tidy data
##
## - Read in gradrate data from multipul files
## - Merge into one data frame
## - Save as RDA file

main <- function(){
  covariates_data <- readxl::read_excel(
	basics$get_absolute_path("data/raw-data/semester_dummy/covariates/covariates.xlsx")
    ) %>%
    df_modules$change_column_name("university_id", "unitid") %>%
    dplyr::mutate(unitid = stringr::str_replace(unitid, "aaaa", "")) %>%
    df_modules$convert_to_double("unitid") %>%
    tidyr::pivot_wider(names_from = "category", values_from = "value")

  save(covariates_data, file = basics$get_absolute_path("src/build/covariates_tidy/output/covariates_data.rda"))
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
