#' Admin Schema
#'
#' Analyze database schema for a given FishStat release.
#'
#' @param release a string identifying a FishStat release.
#'
#' @return
#' List of two data frames, describing database \code{tables} and
#' \code{columns}.
#'
#' @seealso
#' \code{\link{admin_import}} imports a data table from a \verb{.zip} file.
#'
#' @examples
#' \dontrun{
#' schema <- admin_schema("2024.1.0")
#' schema$tables
#' schema$columns
#' }
#'
#' @importFrom utils read.csv unzip
#'
#' @export

admin_schema <- function(release)
{
  zip_aqua <- paste0("data-raw/Aquaculture_", release, ".zip")
  zip_capt <- paste0("data-raw/Capture_", release, ".zip")
  zip_prod <- paste0("data-raw/GlobalProduction_", release, ".zip")

  csv_aqua <- grep("\\.csv$", unzip(zip_aqua, list=TRUE)$Name, value=TRUE)
  csv_capt <- grep("\\.csv$", unzip(zip_capt, list=TRUE)$Name, value=TRUE)
  csv_prod <- grep("\\.csv$", unzip(zip_prod, list=TRUE)$Name, value=TRUE)

  csv <- list(aqua=csv_aqua,
              capt=setdiff(csv_capt, csv_aqua),
              prod=setdiff(csv_prod, union(csv_aqua, csv_capt)))

  csv_dim <- function(zip, csv)
  {
    if(!file.exists(zip))
      zip <- file.path("data-raw", zip)
    if(!file.exists(zip))
      zip <- file.path("../data-raw", zip)
    x <- read.csv(unz(zip, csv), na.strings=NULL, encoding="UTF-8")
    setNames(dim(x), c("nrow", "ncol"))
  }

  csv_colnames <- function(zip, csv, dir="data-raw")
  {
    if(!file.exists(zip))
      zip <- file.path("data-raw", zip)
    if(!file.exists(zip))
      zip <- file.path("../data-raw", zip)
    x <- read.csv(unz(zip, csv), na.strings=NULL, encoding="UTF-8", nrows=1)
    names(x)
  }

  tables <- data.frame(
    zip=basename(rep(c(zip_aqua, zip_capt, zip_prod), sapply(csv, length))),
    csv=unname(unlist(csv)))
  dims <- mapply(csv_dim, tables$zip, tables$csv, USE.NAMES=FALSE)
  tables <- data.frame(tables, t(dims))

  cols <- mapply(csv_colnames, tables$zip, tables$csv, USE.NAMES=FALSE)
  columns <- data.frame(csv=rep(tables$csv, tables$ncol), column=unlist(cols))

  list(tables=tables, columns=columns)
}
