#' @docType data
#'
#' @name environment
#'
#' @title Environments
#'
#' @description Aquatic environments for aquaculture, defined by FAO (2023).
#'
#' @usage
#' environment
#'
#' @format
#' Data frame containing two columns:
#' \tabular{ll}{
#'   \code{environment}      \tab environment code\cr
#'   \code{environment_name} \tab environment name\
#' }
#'
#' @details
#' This data frame contains the full set of 4 data records from the FishStat
#' \emph{Production Environment} data table. Column names have been simplified
#' to facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2023).
#' Aquaculture Production.
#' Fisheries and Aquaculture Division. Rome.
#'
#' \url{https://www.fao.org/fishery/en/collection/aquaculture}
#'
#' @seealso
#' \code{\link{aquaculture}} and \code{\link{capture}} data are also
#' available in a combined \code{\link{production}} format.
#'
#' \code{\link{environment}}, \code{\link{country}}, \code{\link{environment}},
#' \code{\link{measure}}, \code{\link{source}}, \code{\link{species}}, and
#' \code{\link{status}} are lookup tables.
#'
#' \code{\link{fishstat-package}} gives an overview of the package.
#'
#' @examples
#' environment
#'
#' # Aquaculture production by environment in 2021, in million tonnes
#' x <- merge(aquaculture, environment)
#' aggregate(value~environment, x, function(x) sum(x/1e6), subset=year==2021)

NA
