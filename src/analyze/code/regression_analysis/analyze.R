main <- function() {
  data <- readr::read_csv(basics$get_absolute_path("src/build/table_1/output/intermediate.csv"))

  # Switcher に該当する大学名をリスト化
  switcher_instnms_list <- data %>%
    dplyr::distinct(across(-c("instnm", "...1","year", "totcohortsize", 
		    "w_cohortsize", "m_cohortsize", "tot4yrgrads", "m_4yrgrads", 
		    "w_4yrgrads", "women_gradrate_4yr", "gradrate4yr", "men_gradrate_4yr", 
		    "instatetuition", "costs", "faculty", "white_cohortsize", 
		    "per_white_cohort", "per_women_cohort")), .keep_all = TRUE) %>%
    dplyr::group_by(unitid) %>% 
    dplyr::filter(dplyr::n() > 1) %>% # unitidが重複している行だけを抽出
    dplyr::ungroup() %>%
    dplyr::select(instnm) %>%
    dplyr::distinct()

  # Switcher に該当する大学のデータを抽出
  switcher_data <- data %>%
    dplyr::mutate(is_switcher = dplyr::if_else( # is_switcher列を追加
	    # 条件(大学名がswitcher_instnms_listに含まれるか)
	    as.character(instnm) %in% switcher_instnms_list$instnm,  
	    TRUE, # 条件が真の場合
	    FALSE)) %>% # 条件が偽の場合
    dplyr::filter(is_switcher == TRUE)  # is_switcher が TRUE の行だけを抽出

  # yearofsemとunitidを対応させたデータを作成
  yearofsem_unitid <- switcher_data %>%
    dplyr::filter(semester == 1) %>%
    dplyr::group_by(unitid) %>%
    dplyr::summarize(yearofsem = min(year)) %>%
    dplyr::ungroup()

  # yearofsemとunitidを対応させたデータをswitcher_data に結合
  switcher_data <- switcher_data %>%
		dplyr::left_join(yearofsem_unitid, by = "unitid") %>%
		dplyr::mutate(yearstosem = year - yearofsem.x)

}


box::use(functions/basics)
box::use(functions/df_modules)
box::use(functions/plot_modules)
main()
