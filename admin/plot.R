library(TAF)

mkdir("plot")

plot_production <- function(pkg)
{
  library(pkg, character=TRUE)
  pngfile <- paste0(pkg, ".png")
  taf.png(file.path("plot", pngfile))
  example("production", package=pkg, local=TRUE, echo=FALSE, ask=FALSE)
  dev.off()
  detach(paste0("package:", pkg), character=TRUE)
  cmd <- paste0("optipng -quiet plot/", pngfile)
  system(cmd)
  message(pngfile)
}

plot_production("fishstat21")
plot_production("fishstat22")
plot_production("fishstat23")
plot_production("fishstat24")
