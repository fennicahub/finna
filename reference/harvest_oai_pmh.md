# Harvest Metadata from an OAI-PMH Server

This function harvests metadata records from an OAI-PMH-compliant server
in batches, using a custom User-Agent string to identify the service and
returns them in a tibble format.

## Usage

``` r
harvest_oai_pmh(
  base_url,
  metadata_prefix,
  set = NULL,
  verbose = TRUE,
  user_agent = "FinnaHarvester/1.0",
  output_file = NULL,
  record_limit = NULL
)
```

## Arguments

- base_url:

  A string. The base URL of the OAI-PMH server.

- metadata_prefix:

  A string. The metadata format to request (e.g., "oai_dc", "marc21").

- set:

  A string. Optional. A set specifier to limit the harvested records
  (e.g., "non_dedup").

- verbose:

  A logical. Whether to display progress messages. Default is `TRUE`.

- user_agent:

  A string. A custom User-Agent string to identify the service. Default
  is "FinnaHarvester/1.0".

- output_file:

  output file to be saved as a csv file.

- record_limit:

  limits the number of records that the user wants to fetch

## Value

A tibble with the harvested records containing selected metadata fields.

## Examples

``` r
if (FALSE) { # \dontrun{

# Example for oai_dc (Dublin Core)
records_oai_dc <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_dc",
user_agent = "MyCustomHarvester/1.0"
)
# Example for marc21 (MARC 21)
records_marc21 <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "marc21",
user_agent = "MyCustomHarvester/1.0"
)

# Example for oai_vufind_json (VuFind JSON)
records_oai_vufind_json <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_vufind_json",
user_agent = "MyCustomHarvester/1.0"
)

# Example for oai_ead (Encoded Archival Description)
records_oai_ead <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_ead",
user_agent = "MyCustomHarvester/1.0"
)
# Example for oai_ead3 (Encoded Archival Description version 3)
records_oai_ead3 <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_ead3",
user_agent = "MyCustomHarvester/1.0"
)

# Example for oai_forward (Forward metadata format)
records_oai_forward <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_forward",
user_agent = "MyCustomHarvester/1.0"
)

# Example for oai_lido (Lightweight Information Describing Objects)
records_oai_lido <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_lido",
user_agent = "MyCustomHarvester/1.0"
)

# Example for oai_qdc (Qualified Dublin Core)
records_oai_qdc <- harvest_oai_pmh(
base_url = "https://api.finna.fi/OAI/Server",
metadata_prefix = "oai_qdc",
user_agent = "MyCustomHarvester/1.0"
)
} # }
```
