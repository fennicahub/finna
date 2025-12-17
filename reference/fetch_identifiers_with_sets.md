# Fetch OAI-PMH Identifiers with setSpec

Fetches OAI-PMH record identifiers along with their setSpec (collection
name).

## Usage

``` r
fetch_identifiers_with_sets(
  base_url,
  metadata_prefix,
  set = NULL,
  user_agent = "OAIHarvester/1.0"
)
```

## Arguments

- base_url:

  A string. The base URL of the OAI-PMH server.

- metadata_prefix:

  A string. The metadata format (e.g., "marc21").

- set:

  A string. Optional. A set specifier.

- user_agent:

  A string. Custom User-Agent. Default is "OAIHarvester/1.0".

## Value

A tibble with identifier and setSpec.
