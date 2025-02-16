#' Admin Import
#'
#' Import FishStat data table from \verb{.zip} file.
#'
#' @param zipfile zip archive filename containing a collection of data tables.
#' @param type string identifying the type of data table to import from the zip
#'        archive.
#' @param format whether to format and simplify the data table, renaming and
#'        dropping columns.
#'
#' @details
#' The \code{type} string must be one of the following: \preformatted{
#'   aquaculture
#'   area
#'   capture
#'   country
#'   environment
#'   measure (=unit)
#'   production
#'   source
#'   species
#'   status (=symbol)}
#'
#' @return Data frame containing FishStat data.
#'
#' @note This function follows the FishStat database schema from 2024 onwards.
#'
#' @seealso
#' \code{\link{admin_format}} formats a data table.
#'
#' \code{\link{admin_schema}} analyzes the database schema for a given release.
#'
#' @examples
#' \dontrun{
#' # Import and format, one combined step
#' capture <- admin_import("Capture_2024.1.0.zip", "capture")
#'
#' # Import and format, two separate steps
#' capture <- admin_import("Capture_2024.1.0.zip", "capture", format=FALSE)
#' capture <- admin_format(capture, "capture")
#' }
#'
#' @importFrom tools file_ext
#' @importFrom utils read.csv unzip
#'
#' @export

admin_import <- function(zipfile, type, format=TRUE)
{
  # Check args
  type.choices <- c("aquaculture", "area", "capture", "country", "environment",
                    c("measure", "unit"), "production", "source", "species",
                    c("status", "symbol"))
  type.help <- c("aquaculture", "area", "capture", "country", "environment",
                 "measure (=unit)", "production", "source", "species",
                 "status (=symbol)")
  if(missing(type) || !(type %in% type.choices))
    stop("'type' must be one of the following:",
         paste0("\n    ", type.help, collapse=""))

  # Match filenames that change between years
  csv <- unzip(zipfile, list=TRUE)$Name
  # in 2024, CL_FI_SYMBOL.csv changed to CL_FI_SYMBOL_SDMX.csv
  symbol.csv <- csv[csv %in% c("CL_FI_SYMBOL.csv", "CL_FI_SYMBOL_SDMX.csv")]

  # Select filename
  filename <- switch(type,
                     aquaculture="Aquaculture_Quantity.csv",
                     area="CL_FI_WATERAREA_GROUPS.csv",
                     capture="Capture_Quantity.csv",
                     country="CL_FI_COUNTRY_GROUPS.csv",
                     environment="CL_FI_PRODENVIRONMENT.csv",
                     measure="FSJ_UNIT.csv",
                     production="Global_production_quantity.csv",
                     source="CL_FI_PRODUCTION_SOURCE_DET.csv",
                     species="CL_FI_SPECIES_GROUPS.csv",
                     status=symbol.csv,
                     symbol=symbol.csv,
                     unit="FSJ_UNIT.csv")
  filename <- csv[tolower(csv) == tolower(filename)]  # ignore case

  # Read and format table
  x <- read.csv(unz(zipfile, filename), na.strings=NULL, encoding="UTF-8")
  if(format)
    x <- admin_format(x, type=type)

  x
}
