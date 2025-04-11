library(TAF)
source("R/admin_summary.R")

mkdir("summary")

analyze_and_write_summary <- function(year)
{
  message(year)
  tabfile <- paste0("summary/", year, "_tables.csv")
  colfile <- paste0("summary/", year, "_columns.csv")
  pkg <- paste0("fishstat", substring(year, 3, 4))
  library(pkg, character=TRUE)
  summary <- admin_summary(pkg)
  detach(paste0("package:", pkg), character=TRUE)
  write.taf(summary$tables, tabfile)
  write.taf(summary$columns, colfile, quote=TRUE)
}

analyze_and_write_summary(2021)
analyze_and_write_summary(2022)
analyze_and_write_summary(2023)
analyze_and_write_summary(2024)
analyze_and_write_summary(2025)
