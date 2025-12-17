# Save 'Finna' Search Results for Offline Access

This function saves 'Finna' search results and metadata locally to a
file in `.rds` format, allowing users to access and analyze the data
offline without an internet connection.

## Usage

``` r
save_for_offline(data, file_name = "offline_search_results")
```

## Arguments

- data:

  A tibble or data frame containing the 'Finna' search results.

- file_name:

  A string representing the name of the file to save. The function
  automatically appends ".rds" to the name if not already included.

## Value

No return value. Called for its side effects of saving the data to a
file.

## Examples

``` r
if (FALSE) { # \dontrun{
search_results <- search_finna("sibelius")
save_for_offline(search_results, "sibelius_search_results")
} # }
```
