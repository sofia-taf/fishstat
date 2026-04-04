release <- "2021.1.2"
release <- "2022.1.1"
release <- "2023.1.1"
release <- "2024.1.0"
release <- "2025.1.0"
release <- "2026.1.0"

source("R/admin_import.R")
source("R/admin_format.R")
library(tools)  # resaveRdaFiles

dir.create("data", showWarnings=FALSE)

zip_aqua <- paste0("data-raw/Aquaculture_", release, ".zip")
zip_capt <- paste0("data-raw/Capture_", release, ".zip")
zip_prod <- paste0("data-raw/GlobalProduction_", release, ".zip")
csv <- unzip(zip_aqua, list=TRUE)
csv <- unzip(zip_capt, list=TRUE)
csv <- unzip(zip_prod, list=TRUE)
csv <- cbind(grep("\\.csv$", csv$Name, value=TRUE))

cat("Processing 'Aquaculture' zip archive ... ")
aquaculture <- admin_import(zip_aqua, "aquaculture")
save(aquaculture, file="data/aquaculture.RData")
country <- admin_import(zip_aqua, "country")
save(country, file="data/country.RData")
environment <- admin_import(zip_aqua, "environment")
save(environment, file="data/environment.RData")
species <- admin_import(zip_aqua, "species")
save(species, file="data/species.RData")
status <- admin_import(zip_aqua, "status")
save(status, file="data/status.RData")
area <- admin_import(zip_aqua, "area")
save(area, file="data/area.RData")
measure <- admin_import(zip_aqua, "measure")
save(measure, file="data/measure.RData")
cat("done\n")

cat("Processing 'Capture' zip archive ... ")
capture <- admin_import(zip_capt, "capture")
save(capture, file="data/capture.RData")
cat("done\n")

cat("Processing 'GlobalProduction' zip archive ... ")
production <- admin_import(zip_prod, "production")
save(production, file="data/production.RData")
source <- admin_import(zip_prod, "source")
save(source, file="data/source.RData")
cat("done\n")

cat("Compressing .RData files ... ")
resaveRdaFiles(dir("data", full=TRUE))
cat("done\n")
