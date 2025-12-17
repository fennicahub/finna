# Refine Finna Metadata

The `refine_metadata` function cleans and standardizes Finna metadata
by:

- **Validating Required Fields:** Ensures the presence of specified
  fields and returns `NULL` if any are missing.

- **Selecting Relevant Fields:** Allows users to specify which metadata
  fields to retain.

- **Handling Missing Values (Optional):** If `fill_na = TRUE`, replaces
  `NA` values with placeholders.

- **Logging Missing Data (Optional):** If `verbose = TRUE`, prints a
  summary of missing values.

## Usage

``` r
refine_metadata(
  data,
  fields = c("Title", "Author", "Year", "Language", "Formats", "Subjects", "Library",
    "Series"),
  fill_na = FALSE,
  verbose = FALSE
)
```

## Arguments

- data:

  A tibble containing raw Finna metadata.

- fields:

  A character vector of metadata fields to retain. Defaults to standard
  fields.

- fill_na:

  Logical. If `TRUE`, replaces `NA` values with placeholders. Defaults
  to `FALSE`.

- verbose:

  Logical. If `TRUE`, prints a summary of missing values. Defaults to
  `FALSE`.

## Value

A tibble with selected metadata fields, or NULL if required fields are
missing.

## Examples

``` r
library(finna)
sibelius_data <- search_finna("sibelius")
#> Warning: Default limit of 100 records is being used. Specify 'limit' argument for more records.
#> Total results found: 44921
#> Data fetching completed in 0.52 seconds.
refine_metadata(sibelius_data, fill_na = TRUE, verbose = TRUE)
#> No missing values found.
#> # A tibble: 100 × 8
#>    Title                   Author Year  Language Formats Subjects Library Series
#>    <chr>                   <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
#>  1 Sibelius favourites : … Sibel… 2001  Unknown… Äänite… Unknown… Lapin … Unkno…
#>  2 SIBELIUS                TAWAS… 1997  fin      Kirja,… SIBELIUS Anders… Unkno…
#>  3 Sibelius                Tawas… 1997  fin      Kirja,… Sibeliu… Kansal… Unkno…
#>  4 Sibelius                Tawas… 2003  fin      Kirja,… Sibeliu… Blanka… Unkno…
#>  5 Sibelius                Downe… 1945  fin      Kirja,… Sibeliu… Heili-… Unkno…
#>  6 Sibelius                Tawas… 1968  swe      Kirja,… Sibeliu… Anders… Unkno…
#>  7 SIBELIUS                RINGB… 1948  swe      Kirja,… SIBELIU… Helle-… Unkno…
#>  8 SIBELIUS                TAWAS… 1968  swe      Kirja,… SIBELIU… Helle-… Unkno…
#>  9 Sibelius                Gray,… 1934  eng      Kirja,… Sibeliu… PIKI-k… Unkno…
#> 10 Sibelius                Gray,… 1945  eng      Kirja,… Sibeliu… Vanamo… Unkno…
#> # ℹ 90 more rows
```
