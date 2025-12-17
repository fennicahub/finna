# Enrich Author Name from 'Finna' API and Save Results

This function reads a CSV file from a URL containing Melinda IDs and
author names. If the author name is missing (NA), it searches the
'Finna' API for the corresponding Melinda ID to retrieve and update the
author name. The updated data is saved in a CSV file.

## Usage

``` r
enrich_author_name(url, output_file = "updated_na_author_rows.csv")
```

## Arguments

- url:

  A character string specifying the URL of the CSV file with Melinda IDs
  and author names.

- output_file:

  A character string specifying the output CSV file name.

## Value

A tibble with updated author names. The file is saved to a temporary
directory using [`tempdir()`](https://rdrr.io/r/base/tempfile.html).

## Examples

``` r
if (FALSE) { # \dontrun{
enrich_author_name(url = "https://example/na_author_rows.csv",
                   output_file = "updated_na_author_rows.csv")
} # }
```
