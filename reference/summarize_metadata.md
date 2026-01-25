# Summarize metadata fields for reporting and quality control

Create a publication-ready summary table for selected metadata fields.
For each field, the summary reports the number of records, number of
non-missing values, proportion missing, number of unique (non-missing)
values, and the top-N most frequent values with counts.

## Usage

``` r
summarize_metadata(data, fields = NULL, top_n = 3)
```

## Arguments

- data:

  A data frame (or tibble) containing metadata records.

- fields:

  Character vector of column names to summarize. If `NULL` (default),
  all columns in `data` are summarized.

- top_n:

  Integer. Number of most frequent values to report per field. Defaults
  to 3. Must be \>= 0.

## Value

A data frame with one row per summarized field and the following
columns:

- field:

  Field name.

- n:

  Total number of rows in `data`.

- n_non_missing:

  Number of non-missing values (`!is.na`).

- prop_missing:

  Proportion missing in \[0, 1\], rounded to 3 decimals.

- n_unique:

  Number of unique non-missing values.

- top_values:

  Top values formatted as `"value (count); ..."`. `NA` if no non-missing
  values.

## Details

This helper is intended for quick dataset characterization (e.g.,
Methods, appendices, QC notes) after retrieving records with the
package.

## Examples

``` r
record <- search_finna("sibelius")
#> Warning: Default limit of 100 records is being used. Specify 'limit' argument for more records.
#> Total results found: 44905
#> Data fetching completed in 0.31 seconds.
overview <- summarize_metadata(
  record,
  fields = c("id", "Title","Author","Year", "Language", "Formats",
  "Subjects", "Library", "Series", "last_indexed"))
  overview
#>           field   n n_non_missing prop_missing n_unique
#> 1            id 100           100         0.00      100
#> 2         Title 100           100         0.00        4
#> 3        Author 100           100         0.00       49
#> 4          Year 100            98         0.02       40
#> 5      Language 100            89         0.11        7
#> 6       Formats 100           100         0.00       11
#> 7      Subjects 100            72         0.28       63
#> 8       Library 100           100         0.00       62
#> 9        Series 100            23         0.77       14
#> 10 last_indexed 100             0         1.00        0
#>                                                                                                                  top_values
#> 1                                                    abo.kortkat_044103 (1); abo.kortkat_051809 (1); abo.kortkat_099113 (1)
#> 2                                                                                Sibelius (90); SIBELIUS (5); Sibelius. (4)
#> 3                                                       Sibelius, Jean (17); Häyrynen, Antti (11); Lampila, Hannu-Ilari (7)
#> 4                                                                                              1948 (8); 1997 (8); 1945 (6)
#> 5                                                                                              fin (42); zxx (19); eng (12)
#> 6                                                       Kirja, Kirja (52); Äänite, CD (17); Lehti/Artikkeli, Artikkeli (14)
#> 7                                                  Sibelius, Jean. (6); Sibelius, Jean (2); Sibelius, Jean,, 1865-1957. (2)
#> 8  Kansalliskirjasto, Arto (20); Anders-kirjastot, Kokkola (5); Åbo Akademin kirjasto, Digitoitu korttikatalogi (–1981) (5)
#> 9                                                                        CD-sivut (4); Plus CD-lehti (4); Plus CD-sivut (3)
#> 10                                                                                                                     <NA>
```
