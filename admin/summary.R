library(TAF)
source("R/admin_summary.R")

mkdir("summary")

analyze_and_write_summary <- function(year)
{
  tabfile <- paste0("summary/", year, "_tables.csv")
  colfile <- paste0("summary/", year, "_columns.csv")
  pkg <- paste0("fishstat", substring(year, 3, 4))
  summary <- admin_summary(pkg)
  write.taf(summary$tables, tabfile)
  write.taf(summary$columns, colfile, quote=TRUE)
}

message("2021"); analyze_and_write_summary(2021)
message("2022"); analyze_and_write_summary(2022)
message("2023"); analyze_and_write_summary(2023)
message("2024"); analyze_and_write_summary(2024)
