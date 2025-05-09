% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fennica_all_records.R
\name{fetch_all_records}
\alias{fetch_all_records}
\title{Fetch All Records from Finna API}
\usage{
fetch_all_records(
  base_query = "*",
  base_filters = c("collection:\\"FEN\\""),
  sort = "main_date_str asc",
  limit_per_query = 1e+05,
  total_limit = Inf
)
}
\arguments{
\item{base_query}{A string specifying the base query. Defaults to "*".}

\item{base_filters}{A character vector of filters to apply to the query.
Defaults to \code{c('collection:"FEN"')}.}

\item{sort}{A string defining the sort order of the results. Default is "main_date_str asc".}

\item{limit_per_query}{An integer specifying the number of records to fetch per query. Defaults to 100000.}

\item{total_limit}{An integer specifying the maximum number of records to fetch. Defaults to \code{Inf}.}
}
\value{
A tibble containing all fetched records.
}
\description{
This function fetches records from the Finna API in chunks of 100,000,
automatically paginating through the results until the maximum number of
records is reached.
}
\examples{
\dontrun{
  results <- fetch_all_records(
    base_query = "*",
    base_filters = c('collection:"FEN"'),
    sort = "main_date_str asc",
    limit_per_query = 100000,
    total_limit = Inf
  )
  print(results)
}
}
