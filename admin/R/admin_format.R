#' Admin Format
#'
#' Format FishStat data table, renaming and dropping columns.
#'
#' @param x data frame containing FishStat data.
#' @param type string identifying the type of data table to format.
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
#' @note
#' This function does not modify data entries, with one exception:
#'
#' If \code{type = "status"}, then this function changes the data entry
#' \code{"[blank]"} to an empty string \code{""}. This will allow the user to
#' \code{\link{merge}} global production tables with the \code{status} lookup
#' table.
#'
#' @seealso
#' \code{\link{admin_import}} imports a data table from a \verb{.zip} file.
#'
#' @examples
#' \dontrun{
#' # Import and format, one combined step
#' capture <- admin_import("Capture_2024.1.1.zip", "capture")
#'
#' # Import and format, two separate steps
#' capture <- admin_import("Capture_2024.1.1.zip", "capture", format=FALSE)
#' capture <- admin_format(capture, "capture")
#' }
#'
#' @export

admin_format <- function(x, type)
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
         paste0("\n  ", type.help, collapse=""))

  # Rename columns
  names(x) <- tolower(names(x))
  names(x) <- sub("_code$", "", names(x))     # stub _code
  names(x) <- sub("_en$", "", names(x))       # stub _en
  names(x) <- sub("_group$", "", names(x))    # stub _group
  names(x) <- sub("_name$", "", names(x))     # stub _name
  names(x) <- sub("\\..*", "", names(x))      # trailing .*
  names(x)[names(x) == "code"] <- type
  names(x)[names(x) == "cpc"] <- "cpc_group"  # distinguish from cpc_class
  names(x)[names(x) == "period"] <- "year"
  names(x)[names(x) == "production_source_det"] <- "source"
  names(x)[names(x) == "sws_unit"] <- "sws"
  names(x)[names(x) == "symbol"] <- "status"
  names(x)[names(x) == "un"] <- "country"
  names(x)[names(x) == "x3a"] <- "species"
  names(x)[names(x) == "description"] <- paste0(type, "_description")
  names(x)[names(x) == "name"] <- paste0(type, "_name")

  # Drop and reorder columns
  if(type == "aquaculture")
    x <- x[c("species", "year", "area", "country", "value", "measure", "status",
             "environment")]
  if(type == "area")
    x <- x[c("area", "area_name", "inlandmarine", "faregion", "ocean")]
  if(type == "capture")
    x <- x[c("species", "year", "area", "country", "value", "measure",
             "status")]
  if(type == "country")
    x <- x[c("country", "country_name", "iso2", "iso3", "continent",
             "georegion", "ecoclass", "official")]
  if(type == "environment")
    x <- x[c("environment", "environment_name")]
  if(type == "measure" || type == "unit")
    x <- x[c("measure", "measure_name", "short", "multiplier", "unit",
             "measure_description", "sws")]
  if(type == "production")
    x <- x[c("species", "year", "area", "country", "value", "measure", "status",
             "source")]
  if(type == "source")
    x <- x[c("source", "source_name")]
  if(type == "species")
    x <- x[c("species", "species_name", "scientific", "isscaap", "major",
             "cpc_class", "cpc_group", "yearbook", "author", "taxonomic")]
  if(type == "status" || type == "symbol") {
    x <- x[c("status", "status_name", "status_description", "alternate")]
    x$status[x$status == "[blank]"] <- ""
  }

  x
}
