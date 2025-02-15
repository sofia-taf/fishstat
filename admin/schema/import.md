# Special Measures to Import FishStat Data Tables from 2021 Onwards

## Issue 1: CL_FI_SYMBOL.csv -> CL_FI_SYMBOL_SDMX.csv

In 2024, this filename changed, creating a challenge for the `admin_import()`
function.

To handle this, we use `unzip()` and `grep()` to identify which filename to
import, matching the pattern `"CL_FI_SYMBOL.csv|CL_FI_SYMBOL_SDMX.csv"`.
