source("R/admin_import.R")
source("R/admin_format.R")
zipfile <- "data-raw/Aquaculture_2023.1.1.zip"
zipfile <- "data-raw/Capture_2023.1.1.zip"
zipfile <- "data-raw/GlobalProduction_2023.1.1.zip"

csv <- unzip(zipfile, list=TRUE)
csv <- cbind(sort(csv$Name[file_ext(csv$Name) == "csv"]))
csv

type <- "aquaculture"; head(x <- admin_import(zipfile, type, TRUE))
type <- "area";        head(x <- admin_import(zipfile, type, TRUE))
type <- "capture";     head(x <- admin_import(zipfile, type, TRUE))
type <- "country";     head(x <- admin_import(zipfile, type, TRUE))
type <- "environment"; head(x <- admin_import(zipfile, type, TRUE))
type <- "measure";     head(x <- admin_import(zipfile, type, TRUE))
type <- "production";  head(x <- admin_import(zipfile, type, TRUE))
type <- "source";      head(x <- admin_import(zipfile, type, TRUE))
type <- "species";     head(x <- admin_import(zipfile, type, TRUE))
type <- "status";      head(x <- admin_import(zipfile, type, TRUE))

names(x) <- tolower(names(x))
names(x) <- sub("_code$", "", names(x))     # stub _code
names(x) <- sub("_en$", "", names(x))       # stub _en
names(x) <- sub("_group$", "", names(x))    # stub _group
names(x) <- sub("_name$", "", names(x))     # stub _name
names(x) <- sub("\\..*", "", names(x))      # trailing .*
names(x)[names(x) == "code"] <- type
names(x)[names(x) == "cpc"] <- "cpc_group"  # distinguish from cpc_class
names(x)[names(x) == "period"] <- "year"
names(x)[names(x) == "production_source_det"] <- "source"
names(x)[names(x) == "sws_unit"] <- "sws"
names(x)[names(x) == "symbol"] <- "status"
names(x)[names(x) == "un"] <- "country"
names(x)[names(x) == "x3a"] <- "species"
names(x)[names(x) == "description"] <- paste0(type, "_description")
names(x)[names(x) == "name"] <- paste0(type, "_name")

cbind(sort(names(x)))

################################################################################

x <- x[names(x) %in% c("author", "cpc_class", "cpc_group", "isscaap", "major",
                       "name", "scientific", "species", "taxonomic", "yearbook")]

#  N  Field      AtlanticCod                                        YellowfinTuna                                                     Capelin                                            NorthernPrawn
#  3  yearbook   Fish, crustaceans and molluscs, etc.               Fish, crustaceans and molluscs, etc.                              Fish, crustaceans and molluscs, etc.               Fish, crustaceans and molluscs, etc.
#  5  cpc_group  Fish live, fresh or chilled for human consumption  Fish live, fresh or chilled for human consumption                 Fish live, fresh or chilled for human consumption  Crustaceans, live, fresh or chilled
#  7  major      PISCES                                             PISCES                                                            PISCES                                             CRUSTACEA
# 29  cpc_class  Fish of Gadiformes, live, fresh or chilled         Tunas, skipjack or stripe-bellied bonito, live, fresh or chilled  Other pelagic fish, live, fresh or chilled         Cold-water shrimps and prawns (Pandalus spp., Crangon crangon), live, fresh or chilled
# 50  isscaap    Cods, hakes, haddocks                              Tunas, bonitos, billfishes                                        Miscellaneous pelagic fishes                       Shrimps, prawns

x <- x[c("species", "name", "scientific", "isscaap", "major", "cpc_class", "cpc_group", "yearbook", "author", "taxonomic")]

table(x$author)
cbind(names(table(x$cpc)))
cbind(names(table(x$cpc_class)))
table(x$author)
