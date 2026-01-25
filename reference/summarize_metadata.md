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
#> Data fetching completed in 0.45 seconds.
overview <- summarize_metadata(
  record,
  fields = c("id", "Title","Author","Year", "Language", "Formats",
  "Subjects", "Library", "Series", "last_indexed"))
  overview %>%
    select(field, n, prop_missing, n_unique, top_values)
#> Error in overview %>% select(field, n, prop_missing, n_unique, top_values): could not find function "%>%"
```
