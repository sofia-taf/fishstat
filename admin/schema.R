library(TAF)
source("R/admin_schema.R")

mkdir("schema")

analyze_and_write_schema <- function(release)
{
  year <- substring(release, 1, 4)
  message(year)
  tabfile <- paste0("schema/", year, "_tables.csv")
  colfile <- paste0("schema/", year, "_columns.csv")
  schema <- admin_schema(release)
  write.taf(schema$tables, tabfile)
  write.taf(schema$columns, colfile)
}

analyze_and_write_schema("2017.1.1")
analyze_and_write_schema("2018.1.2")
analyze_and_write_schema("2019.1.0")
analyze_and_write_schema("2020.1.0")
analyze_and_write_schema("2021.1.2")
analyze_and_write_schema("2022.1.1")
analyze_and_write_schema("2023.1.1")
analyze_and_write_schema("2024.1.0")
analyze_and_write_schema("2025.1.0")
analyze_and_write_schema("2026.1.0")
