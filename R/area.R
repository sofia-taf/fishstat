#' @docType data
#'
#' @name area
#'
#' @title Areas
#'
#' @description Major inland and marine fishing areas, defined by FAO (2024).
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
#'   \code{faregion}     \tab northern, central, or southern (marine fishing
#'                            areas)\cr
#'   \code{ocean}        \tab Atlantic, Indian, Pacific, or Southern Ocean
#'                            (marine fishing areas)
#' }
#'
#' @details
#' This data frame contains the full set of 29 data records from the FishStat
#' \emph{Water Area Groups} data table. Column names have been simplified to
#' facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2024).
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
#' # 28 'area' entries have non-zero production, 1 has no production
#' nonzero <- unique(production$area[production$value > 0])
#' area.nz <- area[area$area %in% nonzero,]
#' area$area_name[!(area$area %in% nonzero)]  # Antarctica - Inland waters
#'
#' # Areas 98 and 99 are only used for whale catches
#' species_98_99 <- unique(production$species[production$area %in% 98:99])
#' cbind(unique(species$isscaap[species$species %in% species_98_99]))
#'
#' # Marine fishing areas in northern, central, and southern regions
#' area$area[area$faregion == "Northern regions"]
#' area$area[area$faregion == "Central regions"]
#' area$area[area$faregion == "Southern regions"]
#'
#' # Inland waters and marine areas
#' area[area$inlandmarine == "Inland waters", c("area", "area_name")]
#' area[area$inlandmarine == "Marine areas", c("area", "area_name")]
#'
#' # Examine one area
#' print.simple.list(area[area$area == 71,])

NA
