load("data/aquaculture.RData")
load("data/area.RData")
load("data/capture.RData")
load("data/country.RData")
load("data/environment.RData")
load("data/measure.RData")
load("data/production.RData")
load("data/source.RData")
load("data/species.RData")
load("data/status.RData")

# Data scan
head(aquaculture)
head(area)
head(capture)
head(country)
head(environment)
head(measure)
head(production)
head(source)
head(species)
head(status)

# Non-ASCII
print.simple.list(country[country$iso2 == "CI",])      # Côte d'Ivoire
print.simple.list(species[species$species == "CNK",])  # Günther's grenadier

# Column names
cbind(names(aquaculture))
cbind(names(area))
cbind(names(capture))
cbind(names(country))
cbind(names(environment))
cbind(names(measure))
cbind(names(production))
cbind(names(source))
cbind(names(species))
cbind(names(status))
