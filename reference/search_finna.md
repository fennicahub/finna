# Finna Index Search with Total Limit Option

This function retrieves records from the Finna index with an option to
limit the total number of records returned. The function paginates
through the results, fetching records until the specified total limit is
reached.

## Usage

``` r
search_finna(
  query = NULL,
  type = "AllFields",
  fields = NULL,
  filters = NULL,
  facets = NULL,
  facetFilters = NULL,
  sort = "relevance,id asc",
  limit = 100,
  lng = "fi",
  prettyPrint = FALSE
)
```

## Arguments

- query:

  description

- type:

  A string specifying the type of search. Options include "AllFields",
  "Title", "Author", "Subject". Defaults to "AllFields".

- fields:

  A vector of fields to be returned in the search results. Defaults to
  NULL, which returns a standard set of fields.

- filters:

  A vector of filter queries to refine the search. Defaults to NULL.

- facets:

  A vector specifying which facets to return in the results. Defaults to
  NULL.

- facetFilters:

  A vector of regular expressions to filter facets. Defaults to NULL.

- sort:

  A string defining the sort order of the results. Options include:

  - "relevance,id asc" (default)

  - "main_date_str desc" (Year, newest first)

  - "main_date_str asc" (Year, oldest first)

  - "last_indexed desc" (Last modified)

  - "first_indexed desc" (Last added)

  - "callnumber,id asc" (Classmark)

  - "author,id asc" (Author)

  - "title,id asc" (Title)

- limit:

  An integer specifying the total number of records to return across
  multiple pages.

- lng:

  A string for the language of returned translated strings. Options are
  "fi" - Finnish, "en-gb" - English, "sv" - Swedish, "se" - Sami.
  Defaults to "fi" - Finnish.

- prettyPrint:

  A logical value indicating whether to pretty-print the JSON response.
  Useful for debugging. Defaults to FALSE.

## Value

A tibble containing the search results with relevant fields extracted
and provenance information.

## Examples

``` r
search_results <- search_finna("sibelius", sort = "main_date_str desc", limit = 100)
#> Warning: Default limit of 100 records is being used. Specify 'limit' argument for more records.
#> Total results found: 44905
#> Data fetching completed in 0.45 seconds.
print(search_results)
#> # A tibble: 100 × 10
#>    id                Title Author Year  Language Formats Subjects Library Series
#>    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
#>  1 anders.1999498    "Nyt… Koivi… 2026  fin      Kirja,… NA       Anders… NA    
#>  2 cute.7eb47dd8-88… "The… Tuovi… 2026  eng      Kirja,… lapset … Kulttu… Studi…
#>  3 fikka.5908101     "\"M… Sibel… 2026  deu      Nuotti  NA       Kansal… NA    
#>  4 fikka.5908105     "Mäd… Sibel… 2026  deu      Nuotti  NA       Kansal… Werke…
#>  5 fikka.5908113     "Mäd… Sibel… 2026  deu      Nuotti  NA       Kansal… Jean …
#>  6 fikka.5908130     "Mäd… Sibel… 2026  deu      Nuotti  NA       Kansal… Deuts…
#>  7 fikka.5908149     "Fli… Sibel… 2026  swe      Nuotti  NA       Kansal… NA    
#>  8 fikka.5908162     "\"M… Sibel… 2026  deu      Nuotti  NA       Kansal… Sånge…
#>  9 fikka.5908164     "The… Sibel… 2026  eng      Nuotti  NA       Kansal… Sånge…
#> 10 fikka.5908168     "The… Sibel… 2026  eng      Nuotti  NA       Kansal… NA    
#> # ℹ 90 more rows
#> # ℹ 1 more variable: last_indexed <chr>
```
