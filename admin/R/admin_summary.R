#' Admin Summary
#'
#' Analyze \code{fishstat} package contents.
#'
#' @param pkg a package name, e.g. \code{"fishstat21"}.
#'
#' @return
#' List of two data frames, describing package \code{tables} and \code{columns}.
#'
#' @seealso
#' \code{\link{admin_schema}} analyzes the database schema for a given release.
#'
#' \code{\link{admin_import}} imports a data table from a \verb{.zip} file.
#'
#' @examples
#' \dontrun{
#' contents <- admin_summary("fishstat21")
#' contents$tables
#' contents$columns
#' }
#'
#' @export

admin_summary <- function(pkg)
{
  library(pkg, character=TRUE)
  envir <- as.environment(paste0("package:", pkg))
  tabs <- sapply(ls(envir), get, envir=envir)

  tables <- data.frame(table=names(tabs), nrow=sapply(tabs, nrow),
                       ncol=sapply(tabs, ncol), row.names=NULL)

  columns <- data.frame(table=rep(names(tabs), sapply(tabs, length)),
                        column=unlist(sapply(tabs, names)),
                        min=rapply(tabs, min), max=rapply(tabs, max),
                        row.names=NULL)

  columns$min[nchar(columns$min) > 11] <-
    paste0(substring(columns$min[nchar(columns$min) > 11], 1, 8), "...")
  columns$max[nchar(columns$max) > 11] <-
    paste0(substring(columns$max[nchar(columns$max) > 11], 1, 8), "...")

  list(tables=tables, columns=columns)
}
