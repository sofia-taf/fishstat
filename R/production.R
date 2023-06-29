#' @docType data
#'
#' @name production
#'
#' @title Global Aquaculture and Capture Production
#'
#' @description
#' Aquaculture and capture production quantity by species, area, and country for
#' the years 1950-2021, compiled and published by FAO (2023).
#'
#' @usage
#' production
#'
#' @format
#' Data frame containing eight columns:
#' \tabular{ll}{
#'   \code{species} \tab \code{\link{species}} code\cr
#'   \code{year}    \tab year\cr
#'   \code{area}    \tab \code{\link{area}} code\cr
#'   \code{country} \tab \code{\link{country}} code\cr
#'   \code{value}   \tab quantity in tonnes or number of individuals\cr
#'   \code{measure} \tab \code{\link{measure}} code\cr
#'   \code{status}  \tab \code{\link{status}} code\cr
#'   \code{source}  \tab \code{\link{source}} code
#' }
#'
#' @details
#' This data frame contains the full set of 1,130,392 data records from the
#' FishStat \emph{Production Quantity} data table. Column names have been
#' simplified to facilitate quick exploration and plotting in R.
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
#' head(production)
#'
#' # Analyze production measured in tonnes
#' prod.t <- production[production$measure == "Q_tlw" & production$value > 0,]
#' prod.t <- merge(prod.t, species[c("species", "yearbook")])
#'
#' # Select SOFIA species, excluding mammals, reptiles, and plants
#' prod.t <- prod.t[prod.t$yearbook == "Fish, crustaceans and molluscs, etc.",]
#'
#' # Determine origin
#' prod.t <- merge(prod.t, area[c("area", "inlandmarine")])
#' prod.t$origin <- ifelse(prod.t$source == "CAPTURE", "Capture", "Aquaculture")
#' prod.t$w <- ifelse(prod.t$inlandmarine == "Marine areas", "marine", "inland")
#' prod.t$origin <- paste0(prod.t$origin, " (", prod.t$w, ")")
#'
#' # World capture fisheries and aquaculture production
#' x <- xtabs(value~year+origin, aggregate(value~year+origin, prod.t, sum))
#' x <- x[,c(2,1,4,3)] / 1e6
#' library(areaplot)
#' areaplot(x, legend=TRUE, args.legend=list(x="topleft"), ylab="million tonnes")

NA
