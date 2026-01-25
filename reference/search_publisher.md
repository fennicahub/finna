# Finna Publisher Search

This function retrieves only the publisher information from the Finna
index based on the search query.

## Usage

``` r
search_publisher(
  query = NULL,
  limit = 100,
  lng = "fi",
  filters = NULL,
  prettyPrint = FALSE
)
```

## Arguments

- query:

  A string specifying the search query.

- limit:

  An integer specifying the total number of records to return.

- lng:

  A string for the language of returned translated strings. Defaults to
  "fi".

- filters:

  A vector of filter queries to refine the search. Defaults to NULL.

- prettyPrint:

  A logical value indicating whether to pretty-print the JSON response.
  Defaults to FALSE.

## Value

A tibble containing the record IDs and their respective publishers.

## Examples

``` r
publishers <- search_publisher("sibelius", limit = 10)
print(publishers)
#> # A tibble: 10 × 2
#>    id    Publisher                
#>    <chr> <chr>                    
#>  1 NA    Ondine                   
#>  2 NA    NA                       
#>  3 NA    Otava                    
#>  4 NA    Kustannusosakeyhtiö Otava
#>  5 NA    Gummerus                 
#>  6 NA    Gummerus                 
#>  7 NA    Gummerus                 
#>  8 NA    Otava                    
#>  9 NA    Otava                    
#> 10 NA    Otava                    
```
