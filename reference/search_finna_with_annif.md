# Search Finna and Enrich Records with Top Annif Subject Suggestion

This function searches the Finna API for records matching a query and
enriches each record with the top subject suggestion from the Annif API.

## Usage

``` r
search_finna_with_annif(
  query,
  finna_limit = 10,
  annif_project_id = "yso-fi",
  annif_limit = 10,
  annif_threshold = 0,
  annif_language = "fi"
)
```

## Arguments

- query:

  A character string representing the search term for Finna.

- finna_limit:

  An integer specifying the maximum number of Finna records to retrieve.
  Default is 10.

- annif_project_id:

  The project identifier for Annif (e.g., "yso-en"). Default is
  "yso-en".

- annif_limit:

  An optional parameter to specify the maximum number of results to
  return from Annif. Default is 10.

- annif_threshold:

  An optional parameter to specify the minimum score threshold for Annif
  results. Default is 0.

- annif_language:

  An optional parameter to specify the language of subject labels from
  Annif. Default is "en".

## Value

A tibble of Finna records, each enriched with the top Annif subject
suggestion.

## Examples

``` r
if (FALSE) { # \dontrun{
enriched_records <- search_finna_with_annif("Sibelius", finna_limit = 5)
} # }
```
