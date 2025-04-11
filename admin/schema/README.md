# Comparison of Database Schemas

## 2025 Changes

**Tables**

No tables were added, removed, or renamed.

**Columns**

No columns were added, removed, or renamed.

## 2024 Changes

**Tables**

One table was renamed:

```
CL_FI_SYMBOL.csv -> CL_FI_SYMBOL_SDMX.csv
```

**Columns**

Two columns were added to `CL_FI_SYMBOL_SDMX.csv`:

```
Name_Es
Name_Fr
```

## 2023 Changes

**Tables**

One table was renamed:

```
Global_production_Quantity.csv -> Global_production_quantity.csv
```

**Columns**

Five columns were removed from `CL_FI_SPECIES_GROUPS.csv`,

```
Major_Group_Ar
Major_Group_Cn
Major_Group_Es
Major_Group_Fr
Major_Group_Ru
```

and one column was renamed:

```
Major_Group_En -> Major_Group
```

## 2022 Changes

**Tables**

Four tables were renamed:

```
AQUACULTURE_QUANTITY.csv       -> Aquaculture_Quantity.csv
AQUACULTURE_VALUE.csv          -> Aquaculture_Value.csv
CAPTURE_QUANTITY.csv           -> Capture_Quantity.csv
GLOBAL_PRODUCTION_QUANTITY.csv -> Global_production_Quantity.csv
```

**Columns**

Three columns were removed from `FSJ_UNIT.csv`,

```
Name_Ar
Name_Cn
Name_Ru
```

and one column was added:

```
Short_Name
```

## 2021 Changes

**Tables**

One table was added,

```
AQUACULTURE_VALUE.csv
```

and six tables were renamed:

```
TS_FI_AQUACULTURE.csv       -> AQUACULTURE_QUANTITY.csv
TS_FI_CAPTURE.csv           -> CAPTURE_QUANTITY.csv
TS_FI_PRODUCTION.csv        -> GLOBAL_PRODUCTION_QUANTITY.csv
CL_FI_ENVIRONMENT.csv       -> CL_FI_PRODENVIRONMENT.csv
CL_FI_UNIT.csv              -> FSJ_UNIT.csv
CL_FI_PRODUCTION_SOURCE.csv -> CL_FI_PRODUCTION_SOURCE_DET.csv
```

**Columns**

Two columns were removed from `AQUACULTURE_QUANTITY.csv` (effectively moved to
the new `AQUACULTURE_VALUE.csv`),

```
VALUE
VALUE_SYMBOL
```

and eight columns were renamed:

```
SPECIES         -> SPECIES.ALPHA_3_CODE
YEAR            -> PERIOD
PRODUCTION_AREA -> AREA.CODE
COUNTRY         -> COUNTRY.UN_CODE
QUANTITY        -> VALUE
QUANTITY_UNIT   -> MEASURE
QUANTITY_SYMBOL -> STATUS
ENVIRONMENT     -> ENVIRONMENT.ALPHA_2_CODE
```

Seven columns were renamed in `CAPTURE_QUANTITY.csv`:

```
SPECIES      -> SPECIES.ALPHA_3_CODE
YEAR         -> PERIOD
FISHING_AREA -> AREA.CODE
COUNTRY      -> COUNTRY.UN_CODE
QUANTITY     -> VALUE
UNIT         -> MEASURE
SYMBOL       -> STATUS
```

Eight columns were renamed in `GLOBAL_PRODUCTION_QUANTITY.csv`:

```
SPECIES  -> SPECIES.ALPHA_3_CODE
YEAR     -> PERIOD
AREA     -> AREA.CODE
COUNTRY  -> COUNTRY.UN_CODE
QUANTITY -> VALUE
UNIT     -> MEASURE
SYMBOL   -> STATUS
SOURCE   -> PRODUCTION_SOURCE_DET.CODE
```

Eighteen columns were added to `CL_FI_WATERAREA_GROUPS.csv`,

```
Name_Ar
Name_Cn
Name_Ru
InlandMarine_Group_Ar
InlandMarine_Group_Cn
InlandMarine_Group_Es
InlandMarine_Group_Fr
InlandMarine_Group_Ru
FARegion_Group_Ar
FARegion_Group_Cn
FARegion_Group_Es
FARegion_Group_Fr
FARegion_Group_Ru
Ocean_Group_Ar
Ocean_Group_Cn
Ocean_Group_Es
Ocean_Group_Fr
Ocean_Group_Ru
```

and six columns were renamed:

```
FARegion_Group     -> FARegion_Group_En
InlandMarine_Group -> InlandMarine_Group_En
Name_en            -> Name_En
Name_es            -> Name_Es
Name_fr            -> Name_Fr
Ocean_Group        -> Ocean_Group_En
```

Fifteen columns were added to `CL_FI_COUNTRY_GROUPS.csv`,

```
Continent_Group_Ar
Continent_Group_Cn
Continent_Group_Es
Continent_Group_Fr
Continent_Group_Ru
GeoRegion_Group_Ar
GeoRegion_Group_Cn
GeoRegion_Group_Es
GeoRegion_Group_Fr
GeoRegion_Group_Ru
EcoClass_Group_Ar
EcoClass_Group_Cn
EcoClass_Group_Es
EcoClass_Group_Fr
EcoClass_Group_Ru
```

and three columns were renamed:

```
Continent_Group -> Continent_Group_En
EcoClass_Group  -> EcoClass_Group_En
GeoRegion_Group -> GeoRegion_Group_En
```

Ten columns were added to `FSJ_UNIT.csv`:

```
Name_Ar
Name_Cn
Name_Ru
Multiplier
Unit
Description_En
Description_Es
Description_Fr
SWS_Unit
Identifier
```

One column was added to `CL_FI_PRODUCTION_SOURCE_DET.csv`:

```
Sort
```

Twenty-five columns were added to `CL_FI_SPECIES_GROUPS.csv`,

```
ISSCAAP_Group_Ar
ISSCAAP_Group_Cn
ISSCAAP_Group_Es
ISSCAAP_Group_Fr
ISSCAAP_Group_Ru
Major_Group_Ar
Major_Group_Cn
Major_Group_Es
Major_Group_Fr
Major_Group_Ru
CPC_Class_Ar
CPC_Class_Cn
CPC_Class_Es
CPC_Class_Fr
CPC_Class_Ru
CPC_Group_Ar
CPC_Group_Cn
CPC_Group_Es
CPC_Group_Fr
CPC_Group_Ru
Yearbook_Group_Ar
Yearbook_Group_Cn
Yearbook_Group_Es
Yearbook_Group_Fr
Yearbook_Group_Ru
```

two columns were removed,

```
Family
Order
```

and six columns were renamed:

```
X3Alpha_Code   -> X3A_Code
ISSCAAP_Group  -> ISSCAAP_Group_En
Major_Group    -> Major_Group_En
CPC_Class      -> CPC_Class_En
CPC_Group      -> CPC_Group_En
Yearbook_Group -> Yearbook_Group_En
```

One column was added to `CL_FI_SYMBOL.csv`,

```
Alternate
```

and three columns were renamed:

```
Description -> Description_En
Code        -> Identifier
Name        -> Name_En
```
