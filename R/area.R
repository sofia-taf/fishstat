#' @docType data
#'
#' @name area
#'
#' @title Areas
#'
#' @description Major inland and marine fishing areas, defined by FAO (2023).
#'
#' @usage
#' area
#'
#' @format
#' Data frame containing five columns:
#' \tabular{ll}{
#'   \code{area}         \tab area code\cr
#'   \code{area_name}    \tab area name\cr
#'   \code{inlandmarine} \tab inland or marine\cr
#'   \code{faregion}     \tab northern, central, or southern (for marine
#'                             areas)\cr
#'   \code{ocean}        \tab Atlantic, Indian, Pacific, or Southern Ocean (for
#'                             marine areas)
#' }
#'
#' @details
#' This data frame contains the full set of 29 data records from the FishStat
#' \emph{Water Area Groups} data table. Column names have been simplified to
#' facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2023).
#' Global Production.
#' Fisheries and Aquaculture Division. Rome.
#'
#' \url{https://www.fao.org/fishery/en/collection/global_production}
#'
#' @seealso
#' \code{\link{aquaculture}} and \code{\link{capture}} data are also
#' available in a combined \code{\link{production}} format.
#'
#' \code{\link{area}}, \code{\link{country}}, \code{\link{environment}},
#' \code{\link{measure}}, \code{\link{source}}, \code{\link{species}}, and
#' \code{\link{status}} are lookup tables.
#'
#' \code{\link{fishstat-package}} gives an overview of the package.
#'
#' @examples
#' head(area)
#'
#' # List marine areas in northern, central, and southern regions
#' area$area[area$faregion == "Northern regions"]
#' area$area[area$faregion == "Central regions"]
#' area$area[area$faregion == "Southern regions"]
#'
#' # List inland waters
#' area[area$inlandmarine == "Inland waters", c("area", "area_name")]
#'
#' # Examine one area
#' print.simple.list(area[area$area == 71,])

NA
