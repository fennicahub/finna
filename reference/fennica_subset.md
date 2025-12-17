# Sample Subset of Fennica Bibliographic Records

A 300-record sample from the Fennica dataset (Melinda) for demonstration
and testing.

## Usage

``` r
fennica_subset
```

## Format

A data frame with 300 rows and 28 variables:

- melinda_id:

  Melinda record ID (001)

- leader:

  MARC leader field

- 008:

  Fixed-length data elements (008)

- author_name:

  Personal name of the main author (100a)

- author_date:

  Birth/death dates or period of activity (100d)

- author_ID:

  Combined authority ID from fields 100\$0 and 264a

- language:

  Language code(s) (041a)

- language_original:

  Original language (041h)

- title_uniform:

  Uniform title (240a)

- title:

  Main title (245a)

- title_remainder:

  Remainder of title (245b)

- publication_place:

  Place of publication (260a)

- publisher:

  Name of publisher (260b)

- physical_dimensions:

  Dimensions (300c)

- physical_extent:

  Extent (e.g., pages or volumes) (300a)

- publication_frequency:

  Current publication frequency (310a)

- publication_interval:

  Dates of publication or sequential designation (362a)

- signum:

  Call number or shelf mark

- location_852:

  Library location (852a)

- UDK:

  Universal Decimal Classification (080a)

- UDK_aux:

  Auxiliary UDC notation (080x)

- 245n:

  Part/section of a work (245n)

- genre_655:

  Genre/form terms (655a)

- 650a:

  Topical subject headings (650a)

- general_note:

  General note (500a)

- 700a:

  Added entry – personal name (700a)

- 700_0:

  Authority ID for added personal name (700\$0)

- a.15:

  Unidentified field (likely placeholder or parsing artifact)

## Source

<https://www.finna.fi/>
