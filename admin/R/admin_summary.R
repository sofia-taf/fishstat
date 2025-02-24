#' Admin Summary
#'
#' Produce a summary of \code{fishstat} package contents.
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
  # Load package and fetch tables
  library(pkg, character=TRUE)
  envir <- as.environment(paste0("package:", pkg))
  x <- sapply(ls(envir), get, envir=envir)

  # Summarize tables
  tables <- data.frame(table=names(x), nrow=sapply(x, nrow),
                       ncol=sapply(x, ncol), row.names=NULL)

  # Summarize columns
  columns <- data.frame(table=rep(tables$table, tables$ncol),
                        column=unlist(sapply(x, names)), min=rapply(x, min),
                        max=rapply(x, max),
                        unique=rapply(x, function(x) length(unique(x))),
                        nrow=rapply(x, length), row.names=NULL)

  # Truncate text width
  columns$min[nchar(columns$min) > 11] <-
    paste0(substring(columns$min[nchar(columns$min) > 11], 1, 8), "...")
  columns$max[nchar(columns$max) > 11] <-
    paste0(substring(columns$max[nchar(columns$max) > 11], 1, 8), "...")

  list(tables=tables, columns=columns)
}
