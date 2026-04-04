library(TAF)

mkdir("plot")

plot_production <- function(pkg)
{
  year <- paste0("20", substring(pkg, 9))
  message(year)
  library(pkg, character=TRUE)
  pngfile <- paste0(pkg, ".png")
  taf.png(file.path("plot", pngfile))
  example("production", package=pkg, local=TRUE, echo=FALSE, ask=FALSE)
  dev.off()
  detach(paste0("package:", pkg), character=TRUE)
  cmd <- paste0("optipng -quiet plot/", pngfile)
  system(cmd)
}

plot_production("fishstat21")
plot_production("fishstat22")
plot_production("fishstat23")
plot_production("fishstat24")
plot_production("fishstat25")
plot_production("fishstat26")
