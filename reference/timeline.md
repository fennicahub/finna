# Retrieve Timeline

Timeline data for selected variable (possibly across various groups).

## Usage

``` r
timeline(
  x,
  field = "titlecount",
  group = NULL,
  nmin = 0,
  mode = "absolute",
  time.window = 10,
  time.field = "Year",
  plot.type = NULL
)
```

## Arguments

- x:

  data frame

- field:

  Numeric field to summarize in the timeline. The number of entries
  (title count) per decade is used by default. If this argument is used,
  the sum of entries per decade for this field is given.

- group:

  Optional. Name for a data field that indicates groups to compare.

- nmin:

  Include only entries with at least nmin absolute frequency

- mode:

  "absolute" or "relative"

- time.window:

  Time window for the timeline in years. Default: 10 (publication
  decade).

- time.field:

  Specify the field to be used for time. By default: "Year", or if
  time.window is 10, then "publication_decade"

- plot.type:

  generates a plot with options like "lineplot" or "barplot".

## Value

data.frame

## References

See citation("bibliographica")

## Author

Leo Lahti <leo.lahti@iki.fi>

## Examples

``` r
if (FALSE) timeline(df, "gatherings", plot.type = "lineplot") # \dontrun{}
```
