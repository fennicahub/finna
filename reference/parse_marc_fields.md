# Parse a MARC21 Record from Raw XML

Converts MARC21 XML to a named list with field+subfield keys (e.g.,
"245a").

## Usage

``` r
parse_marc_fields(xml_string)
```

## Arguments

- xml_string:

  A string of MARCXML for one record.

## Value

A named list of parsed fields.
