# ====================
# Makefile
# Project: mtbs-treemap
# Author:  My Name
# Date:    2026-09-01
# ====================

# Default target — run the full pipeline
.PHONY: all clean download clean_data model visualize report lint style restore snapshot session pipeline help

all: download clean_data model visualize report session

# Run individual steps ----

download:
	Rscript -e 'source("02_scripts/01_download_data.R")'

clean_data:
	Rscript -e 'source("02_scripts/02_clean_data.R")'

model:
	Rscript -e 'source("02_scripts/03_model_data.R")'

visualize:
	Rscript -e 'source("02_scripts/04_visualize_data.R")'

report:
	quarto render 02_scripts/05_report_data.qmd

lint:
	Rscript -e 'lintr::lint_dir("02_scripts")'

style:
	Rscript -e 'styler::style_dir("02_scripts")'

# Helpers ----

# Delete all outputs and cleaned data (raw data is preserved)
clean:
	Rscript -e 'unlink("01_data/clean_data/*")'
	Rscript -e 'unlink("03_outputs/figures/*")'
	Rscript -e 'unlink("03_outputs/tables/*")'
	@echo "Outputs cleared. Raw data preserved."

restore:
	Rscript -e 'renv::restore()'

snapshot:
	Rscript -e 'renv::snapshot()'

session:
	Rscript -e 'writeLines(capture.output(sessionInfo()), "session-info.txt")'

# Run the DAG pipeline instead (skips steps whose inputs haven't changed)
pipeline:
	Rscript -e 'targets::tar_make()'

help:
	@echo ""
	@echo "  mtbs-treemap"
	@echo ""
	@echo "  Targets:"
	@echo "    make all          Run the full pipeline"
	@echo "    make download     Download raw data"
	@echo "    make clean_data   Clean and process data"
	@echo "    make model        Run models"
	@echo "    make visualize    Generate figures"
	@echo "    make report       Render Quarto report"
	@echo "    make lint         Lint scripts"
	@echo "    make style        Auto-format scripts"
	@echo "    make clean        Delete outputs (raw data preserved)"
	@echo "    make pipeline     Run the targets DAG (tar_make)"
	@echo "    make session      Write session-info.txt"
	@echo "    make restore      Restore renv packages"
	@echo "    make snapshot     Snapshot renv packages"
	@echo ""
