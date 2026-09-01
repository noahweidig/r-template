# =============================================================================
# _targets.R
# Project:     mtbs-treemap
# Description: DAG-based reproducible pipeline. Run with targets::tar_make(),
#              inspect with targets::tar_visnetwork().
# Author:      My Name
# Date:        2026-09-01
# =============================================================================

library(targets)
library(tarchetypes) # tar_quarto()

source(here::here("R", "config.R"))
source(here::here("R", "functions.R"))

tar_option_set(
  packages = c("here", "tidyverse", "janitor", "glue", "fs", "conflicted", "future", "furrr", "arrow", "googledrive", "patchwork", "cowplot", "sf", "terra"),
  format = "rds"
)

list(
  tar_target(raw_data, download_data(), format = "file"),
  tar_target(clean, clean_data(raw_data)),
  tar_target(model_fit, model_data(clean)),
  tar_target(figures, visualize_data(clean), format = "file"),
  tar_quarto(report, path = here::here("02_scripts", "05_report_data.qmd"))
)
