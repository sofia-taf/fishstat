library(TAF)
source("R/admin_schema.R")

mkdir("schema")

analyze_and_write_schema <- function(release)
{
  year <- substring(release, 1, 4)
  tabfile <- paste0("schema/", year, "_tables.csv")
  colfile <- paste0("schema/", year, "_columns.csv")
  schema <- admin_schema(release)
  write.taf(schema$tables, tabfile)
  write.taf(schema$columns, colfile)
}

message("2017"); analyze_and_write_schema("2017.1.1")
message("2018"); analyze_and_write_schema("2018.1.2")
message("2019"); analyze_and_write_schema("2019.1.0")
message("2020"); analyze_and_write_schema("2020.1.0")
message("2021"); analyze_and_write_schema("2021.1.2")
message("2022"); analyze_and_write_schema("2022.1.1")
message("2023"); analyze_and_write_schema("2023.1.1")
message("2024"); analyze_and_write_schema("2024.1.0")
