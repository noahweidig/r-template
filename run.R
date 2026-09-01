# =============================================================================
# run.R
# Project:     mtbs-treemap
# Description: Run the whole pipeline end-to-end with a single Rscript run.R
# Author:      My Name
# Date:        2026-09-01
# =============================================================================

steps <- c(
  "02_scripts/01_download_data.R",
  "02_scripts/02_clean_data.R",
  "02_scripts/03_model_data.R",
  "02_scripts/04_visualize_data.R"
)

for (s in steps) {
  message("\n==> ", s)
  source(here::here(s))
}

quarto::quarto_render(here::here("02_scripts/05_report_data.qmd"))

# Capture the exact environment this run used (reproducibility log)
writeLines(capture.output(sessionInfo()), here::here("session-info.txt"))

message("\n[done] pipeline complete.")
