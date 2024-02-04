main <- function() {
  # Install, initializeはセッション開示時に実行されるはず
  # Build data
  build()

  analyze()
}

build <- function() {
  source("src/build/semester_dummy_tidy/code/build.R")
  source("src/build/gradrate_tidy/code/build.R")
  source("src/build/covariates_tidy/code/build.R")
  source("src/build/gradrate_ready/code/build.R")
  source("src/build/covariates_ready/code/build.R")
  source("src/build/master/code/build.R")

  source("src/build/table_1/code/build.R")
}

analyze <- function() {
	# Descriptive statistics
	source("src/analyze/code/descriptive_statistics/table/analyze.R")
	source("src/analyze/code/descriptive_statistics/4yr_gradrate_trend/analyze.R")
	source("src/analyze/code/descriptive_statistics/semester_rate_trend/analyze.R")
	source("src/analyze/code/descriptive_statistics/scatter_plot/analyze.R")

	# Regression analysis
	source("src/analyze/code/regression_analysis/analyze.R")

	# Problem Set 3
	source("src/analyze/code/problem_set_3/01_simulate/analyze.R")
	source("src/analyze/code/problem_set_3/02_estimate/histgram/analyze.R")
	source("src/analyze/code/problem_set_3/02_estimate/kdensity/analyze.R")
	source("src/analyze/code/problem_set_3/02_estimate/quantile_regression/analyze.R")
}

main()
