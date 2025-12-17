# Fetch Finna Collection Data with Flexible Query

This function retrieves data from the Finna API and formats it as a tidy
tibble.

## Usage

``` r
fetch_finna(
  query = NULL,
  limit = 0,
  facets = "building",
  lng = "fi",
  prettyPrint = TRUE
)
```

## Arguments

- query:

  The query string for filtering results. Defaults to NULL, which
  fetches data without a specific search term.

- limit:

  Maximum number of results to fetch. Defaults to 0.

- facets:

  Facet to retrieve, defaults to "building".

- lng:

  Language for results, defaults to "fi".

- prettyPrint:

  Logical, whether to pretty-print JSON responses.

## Value

A tibble containing the fetched data with relevant fields.

## Examples

``` r
if (FALSE) { # \dontrun{
  fetch_finna(query = "record_format:ead", limit = 0)
  fetch_finna() # Fetches data with no specific query
} # }
```
