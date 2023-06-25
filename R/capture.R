#' @docType data
#'
#' @name capture
#'
#' @title Global Capture Production
#'
#' @description
#' Capture production quantity by species, area, and country for the years
#' 1950-2021, compiled and published by FAO (2023).
#'
#' @usage
#' capture
#'
#' @format
#' Data frame containing eight columns:
#' \tabular{ll}{
#'   \code{species}     \tab \code{\link{species}} code\cr
#'   \code{year}        \tab year\cr
#'   \code{area}        \tab \code{\link{area}} code\cr
#'   \code{country}     \tab \code{\link{country}} code\cr
#'   \code{value}       \tab quantity in tonnes\cr
#'   \code{measure}     \tab \code{\link{measure}} code\cr
#'   \code{status}      \tab \code{\link{status}} code
#' }
#'
#' @details
#' This data frame contains the full set of 1,030,435 data records from the
#' FishStat \emph{Capture Quantity} data table. Column names have been
#' simplified to facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2023).
#' Global Capture Production.
#' Fisheries and Aquaculture Division. Rome.
#'
#' \url{https://www.fao.org/fishery/en/collection/capture}
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
#' head(capture)
#'
#' # Top 10 capture species in 2021
#' x <- aggregate(value~species, capture, sum, subset=year==2021)
#' x <- merge(x, species[c("species", "species_name")])
#' x$value <- round(x$value)
#' head(x[order(-x$value),], 10)
#'
#' # Total capture production by major group since 1950, in million tonnes
#' x <- merge(capture, species[c("species", "major")])
#' aggregate(value~tolower(major), x, function(x) round(sum(x/1e6)))
#'
#' # Annual capture production of all aquatic animals
#' x <- merge(capture, species[c("species", "yearbook")])
#' x <- aggregate(value~year, x, sum)
#' plot(value/1e6~year, x, ylim=c(0,105), ylab="million tonnes")
#' title(main="Capture production: All")

NA
