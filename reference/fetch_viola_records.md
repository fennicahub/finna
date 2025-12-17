# Fetch Viola Records by Year Ranges from Finna API (Including NA Dates)

This function fetches records from the Finna API in chunks divided by
year ranges, handling missing date values.

## Usage

``` r
fetch_viola_records(
  base_query = "*",
  base_filters = c("collection:\"VIO\"", "finna.include_hidden_parts:1"),
  year_ranges = list(c(0, as.numeric(format(Sys.Date(), "%Y")))),
  include_na = TRUE,
  limit_per_query = 1e+05,
  total_limit = Inf,
  delay_after_query = 5
)
```

## Arguments

- base_query:

  The base query string, defaults to "\*".

- base_filters:

  A character vector of filters for the search, e.g.,
  `c('collection:"VIO"')`.

- year_ranges:

  A list of numeric vectors specifying year ranges, e.g.,
  `list(c(2000, 2005), c(2006, 2010))`.

- include_na:

  Whether to include records with missing `main_date_str`. Default is
  `TRUE`.

- limit_per_query:

  Maximum number of records to fetch per query. Default is 100000.

- total_limit:

  Maximum number of records to fetch overall. Default is `Inf`.

- delay_after_query:

  Delay in seconds between queries. Default is 5.

## Value

A tibble containing all fetched records.
