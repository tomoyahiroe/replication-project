main <- function() {
  # 相対パスを取得してデータを読み込む
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

  # yearofsem, yaerstosem, treated を追加
  switcher_data <- switcher_data %>%
		dplyr::left_join(yearofsem_unitid, by = "unitid") %>% # yearofsemを追加
		dplyr::mutate(yearstosem = year - yearofsem) %>% # yearstosemを追加
		dplyr::mutate(treated = dplyr::if_else(yearstosem < 0, 0, 1)) # treatedを追加


  # 保存したいフォルダパス
    save_dir <- basics$get_absolute_path("src/analyze/output/figure/")
  
  # 線形回帰
  lm_result <- lm(gradrate4yr ~ treated, data = switcher_data) 

  lm_result_table <- broom::tidy(lm_result) %>%
    gtsummary::tbl_summary()


  ## 回帰した点と観測データを 1 つのデータフレームにまとめる
  points <- broom::augment(lm_result)

  ## 年齢を x 軸としてプロット
  plot_lm_result <- ggplot2::ggplot(points, ggplot2::aes(x = treated)) + 
    ## 身長を追加
    ggplot2::geom_point(ggplot2::aes(y = gradrate4yr )) + 
    ## 得られた回帰直線を追加
    ggplot2::geom_line(ggplot2::aes(y = .fitted), colour = "red") +
    ## グラフのタイトル
    ggplot2::labs(title = "Linear regression result", x = "Treated", y = "Graduation rate") +
    ## グラフのフォントサイズ
    ggplot2::theme(panel.background = ggplot2::element_blank(), text = ggplot2::element_text(size = 24))

  gt::gtsave(gtsummary::as_gt(lm_result_table),
	     filename = basics$get_absolute_path("src/analyze/output/figure/lm_result_table.png"))
  ggplot2::ggsave(filename = "lm_result_plot.png", plot = plot_lm_result, path = save_dir, 
	  dpi = 320, device = "png")
}


box::use(functions/basics)
box::use(functions/df_modules)
box::use(functions/plot_modules)
main()
