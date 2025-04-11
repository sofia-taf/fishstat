# Comparison of fishstat Packages

## fishstat25

**status**

In 2024, the categories used for production data entries were

```
  A   I   N
92%  5%  3%
```

but in 2025 these changed to

```
  A   E   I
92%  0%  8%
```

## fishstat24

**source**

One row was removed from the `source` table:

```
AQUACULTURE
```

This source type was obsolete, as all aquaculture production is of `source` type
`BRACKISHWATER`, `FRESHWATER`, or `MARINE`.

**status**

The `status` table increased from 7 categories to 16, but only three categories
are used. In 2023, the categories used for production data entries were

```
      E   N
93%  4%  3%
```

but in 2024 these changed to

```
  A   I   N
92%  5%  3%
```

where the three categories describe official, estimated, and negligible values.
The example on the help page for the `status` table uses the `N` category.

## fishstat22

**country**

The `ecoclass` categories in the `country` table changed from

```
Developed countries or areas
Least Developed Countries
Other developing countries or areas
```

to

```
High-income countries
Upper-middle income countries
Lower-middle income countries
Low-income countries
Countries not classified by World Bank
```
