# Special measures to import FishStat data tables from 2021 onwards

## Issue 1: CL_FI_SYMBOL.csv -> CL_FI_SYMBOL_SDMX.csv

In 2024, this filename changed, creating a challenge for the `admin_import()`
function. The function should import the status table, but the filename is
uncertain.

To handle this, we look up the filenames inside the zip archive and then
identify which filename to import, matching either filename:

```
csv <- unzip(zipfile, list=TRUE)$Name
symbol.csv <- csv[csv %in% c("CL_FI_SYMBOL.csv", "CL_FI_SYMBOL_SDMX.csv")]
```

## Issue 2: Uppercase vs. lowercase CSV filenames

In 2023, one filename changed case,

```
Global_production_Quantity.csv -> Global_production_quantity.csv
```

and in 2022, four filenames changed case,

```
AQUACULTURE_QUANTITY.csv       -> Aquaculture_Quantity.csv
AQUACULTURE_VALUE.csv          -> Aquaculture_Value.csv
CAPTURE_QUANTITY.csv           -> Capture_Quantity.csv
GLOBAL_PRODUCTION_QUANTITY.csv -> Global_production_Quantity.csv
```

creating a challenge for the `admin_import()` function. The function should
import these tables, but the filename is uncertain.

To handle this, we look up the filenames inside the zip archive and then assign
the filename based on case-insensitive matching:

```
csv <- unzip(zipfile, list=TRUE)$Name
filename <- csv[tolower(csv) == tolower(filename)]
```

## Issue 3: New column 'Short_Name'

In 2022, a new column `Short_Name` was added to the `FSJ_UNIT.csv` table,
creating a challenge for the `admin_format()` function. The format function
should rename the `Short_Name` column to `short`, but it's uncertain whether the
`Short_Name` column exists.

To handle this, we check if this column exists in the CSV file. If it doesn't,
we create a dummy `Short_Name` column that contains the same values as the full
`Name_En`:

```
if((type == "measure" || type == "unit") && !any(names(x) == "Short_Name"))
  x$Short_Name <- x$Name_En
```
