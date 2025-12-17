# Check Access to the Finna API

This function tests whether R can successfully connect to the Finna API
by downloading the OpenAPI specification from
`https://api.finna.fi/api/v1/?openapi`. It returns a logical value
indicating the accessibility of the API.

## Usage

``` r
check_api_access()
```

## Value

A logical value:

- `TRUE`: The API is accessible.

- `FALSE`: The API is not accessible.

## Examples

``` r
if (FALSE) { # \dontrun{
  # Check if the API is accessible
  access <- check_api_access()
  if (access) {
    message("Finna API is accessible")
  } else {
    message("Finna API is not accessible")
  }
} # }
```
