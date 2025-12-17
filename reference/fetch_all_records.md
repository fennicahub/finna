# Fetch All Records from Finna API

This function fetches records from the Finna API in chunks of 100,000,
automatically paginating through the results until the maximum number of
records is reached.

## Usage

``` r
fetch_all_records(
  base_query = "*",
  base_filters = c("collection:\"FEN\""),
  sort = "main_date_str asc",
  limit_per_query = 1e+05,
  total_limit = Inf
)
```

## Arguments

- base_query:

  A string specifying the base query. Defaults to "\*".

- base_filters:

  A character vector of filters to apply to the query. Defaults to
  `c('collection:"FEN"')`.

- sort:

  A string defining the sort order of the results. Default is
  "main_date_str asc".

- limit_per_query:

  An integer specifying the number of records to fetch per query.
  Defaults to 100000.

- total_limit:

  An integer specifying the maximum number of records to fetch. Defaults
  to `Inf`.

## Value

A tibble containing all fetched records.

## Examples

``` r
if (FALSE) { # \dontrun{
  results <- fetch_all_records(
    base_query = "*",
    base_filters = c('collection:"FEN"'),
    sort = "main_date_str asc",
    limit_per_query = 100000,
    total_limit = Inf
  )
  print(results)
} # }
```
