main <- function() {
  # Install packages
  # install()

  # Initialize
  initialize()

  # Build data
  build()
}

install <- function() {
  source("src/admin/packages/admin.R")
}

initialize <- function() {
  source("src/admin/initialize/admin.R")
}

build <- function() {
  source("src/build/semester_dummy_tidy/code/build.R")
  source("src/build/gradrate_tidy/code/build.R")
  source("src/build/covariates_tidy/code/build.R")
  source("src/build/gradrate_ready/code/build.R")
  source("src/build/covariates_ready/code/build.R")
  source("src/build/master/code/build.R")
}

main()
