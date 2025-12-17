# Load 'Finna' Search Results from Offline File

This function loads previously saved 'Finna' search results from a local
`.rds` file for offline access.

## Usage

``` r
load_offline_data(file_name = "offline_search_results")
```

## Arguments

- file_name:

  A string representing the name of the file to load. The function
  automatically appends ".rds" if not already included.

## Value

A tibble or data frame containing the loaded search results.

## Examples

``` r
if (FALSE) { # \dontrun{
search_results <- search_finna("sibelius")
save_for_offline(search_results, "sibelius_search_results")
offline_data <- load_offline_data("sibelius_search_results")
print(offline_data)
} # }
```
