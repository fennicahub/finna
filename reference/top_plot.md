# Plot Top Entries

Visualizes the top entries for a given field in a data frame. Count and
percentage statistics is also shown as needed.

## Usage

``` r
top_plot(
  x,
  field = NULL,
  ntop = NULL,
  highlight = NULL,
  max.char = Inf,
  show.rest = FALSE,
  show.percentage = FALSE,
  log10 = FALSE
)
```

## Arguments

- x:

  Data frame, vector or factor

- field:

  Field to show

- ntop:

  Number of top entries to show

- highlight:

  Entries from the 'field' to be highlighted

- max.char:

  Max number of characters in strings. Longer strings will be cut and
  only max.char first characters are shown. No cutting by default

- show.rest:

  Show the count of leave-out samples (not in top-N) as an additional
  bar.

- show.percentage:

  Show the proportion of each category with respect to the total sample
  count.

- log10:

  Show the counts on log10 scale (default FALSE)

## Value

ggplot object

## References

See citation("bibliographica")

## Author

Leo Lahti <leo.lahti@iki.fi>

## Examples

``` r
if (FALSE) p <- top_plot(x, field, 50) # \dontrun{}
```
