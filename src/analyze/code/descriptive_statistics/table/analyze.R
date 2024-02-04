main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/master/output/master.csv"))
# TODO: 記述統計表の作り方を参考にしながら、実際に記述統計表を作成する。

  data %>%
    janitor::get_dupes(unitid, instnm, semester, quarter)
    # gtsummary::tbl_summary()
}

box::use(functions/basics)
box::use(functions/df_modules)
main()
