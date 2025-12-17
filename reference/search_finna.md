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
#> Total results found: 44920
#> Data fetching completed in 1.00 seconds.
print(search_results)
#> # A tibble: 100 × 10
#>    id                Title Author Year  Language Formats Subjects Library Series
#>    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
#>  1 eepos.3276069     Nyt … Koivi… 2026  fin      Kirja,… NA       Eepos-… NA    
#>  2 anders.1971521    Hels… Muhon… 2025  fin      Kirja,… Pokko, … Anders… NA    
#>  3 3amk.317967       Kerr… Helin… 2025  fin      Kirja,… matkail… 3AMK-k… NA    
#>  4 eepos.3204223     Finl… Parne… 2025  eng      Kirja,… Suomi    Eepos-… Insig…
#>  5 uniarts_print.99… Pers… Merta… 2025  eng      Opinnä… Hammer,… Taidey… EST-j…
#>  6 eepos.3213610     Symp… Sibel… 2025  zxx      Äänite… NA       Eepos-… NA    
#>  7 helmet.2607883    Jean… Griml… 2025  eng      Kirja,… Sibeliu… Helmet… NA    
#>  8 uniarts_print.99… Chil… Cappo… 2025  eng      Opinnä… lapset … Taidey… Studi…
#>  9 uniarts_print.99… Aika… Kasti… 2025  NA       Äänite… NA       Taidey… Sibel…
#> 10 uniarts_print.99… Nord… Jõged… 2025  est      Äänite… NA       Taidey… Sibel…
#> # ℹ 90 more rows
#> # ℹ 1 more variable: last_indexed <chr>
```
