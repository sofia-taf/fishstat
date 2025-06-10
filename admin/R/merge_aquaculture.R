merge_aquaculture <- function()
{
  x <- aquaculture

  # links
  area_link <- match(aquaculture$area, area$area)
  country_link <- match(aquaculture$country, country$country)
  measure_link <- match(aquaculture$measure, measure$measure)
  source_link <- match(aquaculture$source, source$source)
  species_link <- match(aquaculture$species, species$species)
  status_link <- match(aquaculture$status, status$status)

  # area
  x$area_name <- area$area_name[area_link]
  x$inlandmarine <- area$inlandmarine[area_link]
  x$faregion <- area$faregion[area_link]
  x$ocean <- area$ocean[area_link]

  # country
  x$country_name <- country$country_name[area_link]
  x$iso2 <- country$iso2[area_link]
  x$iso3 <- country$iso3[area_link]
  x$continent <- country$continent[area_link]
  x$georegion <- country$georegion[area_link]
  x$ecoclass <- country$ecoclass[area_link]
  x$official <- country$official[area_link]

  # environment
  x$environment_name <- environment$environment_name[area_link]

  # measure
  x$measure_name <- measure$measure_name[area_link]
  x$short <- measure$short[area_link]
  x$multiplier <- measure$multiplier[area_link]
  x$unit <- measure$unit[area_link]
  x$measure_description <- measure$measure_description[area_link]
  x$sws <- measure$sws[area_link]

  # species
  x$species_name <- species$species_name[area_link]
  x$scientific <- species$scientific[area_link]
  x$isscaap <- species$isscaap[area_link]
  x$major <- species$major[area_link]
  x$cpc_class <- species$cpc_class[area_link]
  x$cpc_group <- species$cpc_group[area_link]
  x$yearbook <- species$yearbook[area_link]
  x$author <- species$author[area_link]
  x$taxonomic <- species$taxonomic[area_link]

  # status
  x$status_name <- status$status_name[area_link]
  x$status_description <- status$status_description[area_link]
  x$alternate <- status$alternate[area_link]

  x
}
