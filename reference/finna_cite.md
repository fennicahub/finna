# Cite a Finna collection

Automatically generates a citation for a Finna collection result.

## Usage

``` r
finna_cite(result, index, style = "citation")
```

## Arguments

- result:

  The Finna collection result as a tibble.

- index:

  The index of the collection to cite (numeric).

- style:

  The citation style to use (default: "citation"). See
  [`bibentry`](https://rdrr.io/r/utils/bibentry.html).

## Value

A bibliographic entry (`bibentry`) printed in the specified style.
