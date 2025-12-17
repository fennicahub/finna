# Get Finna Records by IDs with Extended Options

This function retrieves multiple Finna records based on a vector of
record IDs. You can specify which fields to return, the language, and
the pagination options.

## Usage

``` r
get_finna_records(
  ids,
  field = NULL,
  prettyPrint = FALSE,
  lng = "fi",
  page = 1,
  limit = 100
)
```

## Arguments

- ids:

  A vector of record IDs to retrieve.

- field:

  A vector of fields to return. Defaults to NULL, which returns all
  default fields.

- prettyPrint:

  Logical; whether to pretty-print the response. Defaults to FALSE.

- lng:

  Language for returned translated strings. Defaults to "fi".

- page:

  The page number to retrieve. Defaults to 1.

- limit:

  The number of records to return per page. Defaults to 20.

## Value

A tibble containing the retrieved records data with provenance
information.

## Examples

``` r
records <- get_finna_records("fikka.3405646", field = "title", prettyPrint = TRUE, lng = "en-gb")
print(records)
#> # A tibble: 1 × 10
#>   id    Title    Author Year  Language Publisher Formats Subjects Library Series
#>   <chr> <chr>    <chr>  <chr> <chr>    <chr>     <chr>   <chr>    <chr>   <chr> 
#> 1 NA    Uimaved… NA     NA    NA       NA        NA      NA       NA      NA    
```
