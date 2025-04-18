% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_finna_records.R
\name{get_finna_records}
\alias{get_finna_records}
\title{Get Finna Records by IDs with Extended Options}
\usage{
get_finna_records(
  ids,
  field = NULL,
  prettyPrint = FALSE,
  lng = "fi",
  page = 1,
  limit = 100
)
}
\arguments{
\item{ids}{A vector of record IDs to retrieve.}

\item{field}{A vector of fields to return. Defaults to NULL, which returns all default fields.}

\item{prettyPrint}{Logical; whether to pretty-print the response. Defaults to FALSE.}

\item{lng}{Language for returned translated strings. Defaults to "fi".}

\item{page}{The page number to retrieve. Defaults to 1.}

\item{limit}{The number of records to return per page. Defaults to 20.}
}
\value{
A tibble containing the retrieved records data with provenance information.
}
\description{
This function retrieves multiple Finna records based on a vector of record IDs. You can specify
which fields to return, the language, and the pagination options.
}
\examples{
records <- get_finna_records("fikka.3405646", field = "title", prettyPrint = TRUE, lng = "en-gb")
print(records)
}
