# Fetch Available OAI-PMH Sets

Fetches and lists the available sets (collections) from an OAI-PMH
server.

## Usage

``` r
fetch_oai_sets(base_url, user_agent = "FinnaHarvester/1.0")
```

## Arguments

- base_url:

  A string. The base URL of the OAI-PMH server.

- user_agent:

  A string. Custom User-Agent string. Default is "OAIHarvester/1.0".

## Value

A tibble with setSpec and setName columns.
