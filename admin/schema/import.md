# Special Measures to Import FishStat Data Tables from 2021 Onwards

## Issue 1: CL_FI_SYMBOL.csv -> CL_FI_SYMBOL_SDMX.csv

In 2024, this filename changed, creating a challenge for the `admin_import()`
function.

To handle this, we use `unzip()` and `grep()` to identify which filename to
import, matching the pattern `"CL_FI_SYMBOL.csv|CL_FI_SYMBOL_SDMX.csv"`.

## Issue 2: Uppercase vs. Lowercase CSV Filenames

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

creating a challenge for the `admin_import()` function.

To handle this, we look up the filenames inside the zip archive
and assign the filename based on
case-insensitive matching:

```
csv <- unzip(zipfile, list=TRUE)$Name
filename <- csv[tolower(csv) == tolower(filename)]
```
