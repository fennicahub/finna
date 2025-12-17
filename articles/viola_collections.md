# Viola in Finna

[Viola](https://kansalliskirjasto.finna.fi/Content/viola) is the Finnish
national discography and the national bibliography of sheet music,
maintained by the National Library of Finland. It contains information
on Finnish music recordings and sheet music, as well as music archives
included in the National Library’s collections.

This R Markdown document provides a comprehensive guide to querying and
analyzing Viola collection data using the Finna API and the
`fetch_viola_records` function.

## Viola Collection in Finna

The `fetch_viola_records` function allows batch processing of data from
the Viola collection in Finna, across multiple year ranges, and handles
records without date information.

### Example Usage

#### Fetch Data Across Year Ranges

The following example fetches data from the Viola collection for the
year ranges: 0–1699, 1700–1799, and 1800–1899.

``` r
library(finna)
library(tidyverse)
# Fetch records
results <- fetch_viola_records(
  base_query = "*",
  base_filters = c('collection:"VIO"'), # Filters for the Viola collection
  year_ranges = list(c(0,1699),c(1700,1799),c(1800,1899)),           # Year ranges to query
  include_na = TRUE,                   # Include records with missing dates
  limit_per_query = 100000,              # Maximum records per query
  total_limit = Inf,                 # Overall record limit
  delay_after_query = 3                # Delay between API calls
  )

# View the number of records fetched
print(nrow(results))
```

    ## [1] 3322

``` r
head(results)
```

    ## # A tibble: 6 × 10
    ##   id    Title Author Year  Language Formats Subjects Library Series last_indexed
    ##   <chr> <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr>  <chr>       
    ## 1 fikk… Libe… NA     1550  lat      Nuotti  arkisto… Kansal… NA     NA          
    ## 2 fikk… Libe… NA     1518  lat      Nuotti  arkisto… Kansal… NA     NA          
    ## 3 fikk… Demo  NA     NA    zxx      Äänite… NA       Kansal… NA     NA          
    ## 4 fikk… Een … Palm,… 1678  swe      Nuotti  1678; t… Kansal… NA     NA          
    ## 5 fikk… [Ant… NA     1608  lat      Nuotti  arkisto… Kansal… NA     NA          
    ## 6 fikk… [Zac… NA     1676  swe      Nuotti  Collian… Kansal… NA     NA

#### Fetch Records Without Dates

You can also fetch records missing the `main_date_str` field:

``` r
# Fetch undated records
undated_records <- search_finna(
  query = "*",
  filters = c('collection:"VIO"', '-main_date_str:*'),
  limit = Inf
)

# View undated records
print(undated_records)
```

    ## # A tibble: 2,482 × 10
    ##    id             Title    Author Year  Language Formats Subjects Library Series
    ##    <chr>          <chr>    <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 fikka.2834441  Graduale NA     NA    lat      Kirja,… arkisto… Kansal… NA    
    ##  2 fikka.2834442  Antipho… NA     NA    lat      Kirja,… arkisto… Kansal… NA    
    ##  3 fikka.1030650  [Antiph… NA     NA    lat      Teksti… arkisto… Kansal… NA    
    ##  4 fikka.1041233  [Antiph… NA     NA    lat      Teksti… arkisto… Kansal… NA    
    ##  5 fikka.1041339  [Antiph… NA     NA    lat      Teksti… arkisto… Kansal… NA    
    ##  6 fikka.5207343  [Gradua… NA     NA    fin      Nuotti  arkisto… Kansal… NA    
    ##  7 jykdok.1827911 Sotiemm… NA     NA    fin      Äänite… NA       Jyväsk… NA    
    ##  8 fikka.4941590  Demo     NA     NA    zxx      Äänite… NA       Kansal… NA    
    ##  9 fikka.4941603  Boogie … NA     NA    zxx      Äänite… NA       Kansal… NA    
    ## 10 fikka.4941825  Close-up NA     NA    zxx      Äänite… NA       Kansal… NA    
    ## # ℹ 2,472 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

To fetch the whole data using batches of years we can use the
[`fetch_viola_records()`](../reference/fetch_viola_records.md) function
as which provides all the viola data in the given interval including the
`NA` dates and hidden parts

``` r
results <- fetch_viola_records(
    base_query = "*",
    base_filters = c('collection:"VIO"'), # Filters for the Viola collection
    year_ranges = list(c(0,1699)),           # Year ranges to query
    include_na = TRUE,                   # Include records with missing dates
    limit_per_query = 100000,              # Maximum records per query
    total_limit = Inf,                 # Overall record limit
    delay_after_query = 3                # Delay between API calls
)
result <- head(results)
print(result)
```

    ## # A tibble: 6 × 10
    ##   id    Title Author Year  Language Formats Subjects Library Series last_indexed
    ##   <chr> <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr>  <chr>       
    ## 1 fikk… Libe… NA     1550  lat      Nuotti  arkisto… Kansal… NA     NA          
    ## 2 fikk… Libe… NA     1518  lat      Nuotti  arkisto… Kansal… NA     NA          
    ## 3 fikk… Demo  NA     NA    zxx      Äänite… NA       Kansal… NA     NA          
    ## 4 fikk… Een … Palm,… 1678  swe      Nuotti  1678; t… Kansal… NA     NA          
    ## 5 fikk… [Ant… NA     1608  lat      Nuotti  arkisto… Kansal… NA     NA          
    ## 6 fikk… [Zac… NA     1676  swe      Nuotti  Collian… Kansal… NA     NA

## Fetching full Viola data

In order to fetch the full Viola data we need to follow the following
method as there is a limitation to the maximum allowed API request.

1.  We need to divide the whole data into ranges of dates based on their
    year.
2.  We need to make sure each range of years should return less than the
    maximum limit which is 100,000.
3.  Since there are hidden collections we need to add in the base
    filters \`“finna.include_hidden_parts:1”\`\`
4.  Then we can follow the same pattern of request as follows.

**Note** The more recent years have huge collections so it is
recommended to use 1-2 year gap like, `c(2023,2024)`.

year_ranges = list(c(0,1699),c(1700,1799),c(1800,1899),),

Here is the example code for the whole data.

``` r
fetch_viola_records(
    base_query = "*",
    base_filters = c('collection:"VIO"', "finna.include_hidden_parts:1"),
    year_ranges = list(
        c(0, 1699), 
        c(1700, 1799), 
        c(1800, 1899), 
        c(1900, 1929), 
        c(1930, 1949), 
        c(1950, 1979), 
        c(1980, 1999), 
        c(2000, 2009), 
        c(2010, 2019), 
        c(2020, 2025) # Fixed this range
    ),
    include_na = TRUE,                   
    limit_per_query = 100000,              
    total_limit = Inf,                
    delay_after_query = 3                
)
```

------------------------------------------------------------------------

## Data Visualization

The Viola collection data can be visualized using metadata refinement
and plotting functions.

#### Author Distribution

``` r
library(finna)
library(ggplot2)

# Refine metadata and visualize author distribution
refined_data <- refine_metadata(results)
top_plot(refined_data$Author, field = "Author", ntop = 10, show.percentage = TRUE) +
  xlab("Author") +  # Custom X-axis label
  ylab("Percentage")  # Custom Y-axis label
```

![viola author
distribution](viola_collections_files/figure-html/unnamed-chunk-5-1.png)
