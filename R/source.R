#' @docType data
#'
#' @name source
#'
#' @title Sources
#'
#' @description
#' Sources of aquaculture and capture production, defined by FAO (2023).
#'
#' @usage
#' source
#'
#' @format
#' Data frame containing two columns:
#' \tabular{ll}{
#'   \code{source}      \tab source code\cr
#'   \code{source_name} \tab source name
#' }
#'
#' @details
#' This data frame contains the full set of 5 data records from the FishStat
#' \emph{Production Source} data table. Column names have been simplified
#' to facilitate quick exploration and plotting in R.
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
#' source
#'
#' # Production by source in 2021, in million tonnes
#' x <- merge(production[production$measure == "Q_tlw",], source)
#' x <- aggregate(value~source_name, x, sum, subset=year==2021)
#' transform(x, value=round(value/1e6))

NA
