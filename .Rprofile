# .Rprofile — sourced at the start of every R session in this project.

# Quieter, friendlier defaults
options(
  stringsAsFactors = FALSE,
  scipen = 999,
  warnPartialMatchArgs = TRUE,
  repos = c(CRAN = "https://cloud.r-project.org")
)

# Activate renv if present
if (file.exists("renv/activate.R")) source("renv/activate.R")

if (interactive()) {
  message("Project: mtbs-treemap  |  R ", getRversion())
}
