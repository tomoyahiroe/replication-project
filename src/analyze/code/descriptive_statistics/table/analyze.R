main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/table_1/output/intermediate.csv"))

  # Switcher に該当する大学名をリスト化
  switcher_instnms_list <- data %>%
    dplyr::distinct(across(-c("instnm", "...1","year", "totcohortsize", "w_cohortsize", "m_cohortsize", "tot4yrgrads", "m_4yrgrads", "w_4yrgrads", "women_gradrate_4yr", "gradrate4yr", "men_gradrate_4yr", "instatetuition", "costs", "faculty", "white_cohortsize", "per_white_cohort", "per_women_cohort")), .keep_all = TRUE) %>%
    dplyr::group_by(unitid) %>% 
    dplyr::filter(dplyr::n() > 1) %>% # unitidが重複している行だけを抽出
    dplyr::ungroup() %>%
    dplyr::select(instnm) %>%
    dplyr::distinct()

  # data に is_switcher 列を追加
  switcher_data <- data %>%
		dplyr::mutate(is_switcher = dplyr::if_else(as.character(instnm) %in% switcher_instnms_list$instnm, "Switcher", "Never Switcher"))

  # テーブルデータを作成
  table_data <- switcher_data %>%
    dplyr::select("is_switcher","totcohortsize", "w_cohortsize", "m_cohortsize", "tot4yrgrads",
		  "w_4yrgrads", "m_4yrgrads", "gradrate4yr", "women_gradrate_4yr", 
		  "men_gradrate_4yr", "per_women_cohort", "per_white_cohort", "instatetuition", 
		  "faculty", "costs") %>%
    gtsummary::tbl_summary(
	by = is_switcher,
	missing = "no",
	type = list(
	    c("totcohortsize", "w_cohortsize", "m_cohortsize", "tot4yrgrads",
	      "m_4yrgrads", "w_4yrgrads", "women_gradrate_4yr", "men_gradrate_4yr",
	      "gradrate4yr", "instatetuition", "costs",
	      "per_white_cohort", "per_women_cohort") 
	    ~ "continuous"),
	statistic = list(
	    c("totcohortsize", "w_cohortsize", "m_cohortsize", "women_gradrate_4yr",
	      "men_gradrate_4yr", "gradrate4yr") 
	    ~ "{mean} ({sd})"),
        label = list(totcohortsize ~ "Cohort Size",
	    w_cohortsize ~ "Women's Cohort Size",
	    m_cohortsize ~ "Men's Cohort Size",
	    tot4yrgrads ~ "4-Year Graduates",
	    men_gradrate_4yr ~ "Men's 4-Year Graduation Rate",
	    women_gradrate_4yr ~ "Women's 4-Year Graduation Rate",
	    gradrate4yr ~ "4-Year Graduation Rate",
	    instatetuition ~ "In-State Tuition",
	    per_white_cohort ~ "White Cohort Size(%)",
	    per_women_cohort ~ "Women's Cohort Size(%)",
	    m_4yrgrads ~ "Men's 4-Year Graduates",
	    w_4yrgrads ~ "Women's 4-Year Graduates")
      ) %>%
      gtsummary::add_overall() %>%
      gtsummary::add_n() %>%
      gtsummary::modify_caption("Table 1—Institution-Level Summary Statistics") %>%
      gtsummary::modify_header(label ~ "**Variable**")


    # テーブルデータを出力
    gt::gtsave(gtsummary::as_gt(table_data), filename = basics$get_absolute_path("src/analyze/output/table/table_1.png"))


  }

box::use(functions/basics)
box::use(functions/df_modules)
main()
