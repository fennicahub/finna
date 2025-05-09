% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/refine_metadata.R
\name{refine_metadata}
\alias{refine_metadata}
\title{Refine Finna Metadata}
\usage{
refine_metadata(
  data,
  fields = c("Title", "Author", "Year", "Language", "Formats", "Subjects", "Library",
    "Series"),
  fill_na = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{data}{A tibble containing raw Finna metadata.}

\item{fields}{A character vector of metadata fields to retain. Defaults to standard fields.}

\item{fill_na}{Logical. If \code{TRUE}, replaces \code{NA} values with placeholders. Defaults to \code{FALSE}.}

\item{verbose}{Logical. If \code{TRUE}, prints a summary of missing values. Defaults to \code{FALSE}.}
}
\value{
A tibble with selected metadata fields, or NULL if required fields are missing.
}
\description{
The \code{refine_metadata} function cleans and standardizes Finna metadata by:
\itemize{
\item \strong{Validating Required Fields:} Ensures the presence of specified fields and returns \code{NULL} if any are missing.
\item \strong{Selecting Relevant Fields:} Allows users to specify which metadata fields to retain.
\item \strong{Handling Missing Values (Optional):} If \code{fill_na = TRUE}, replaces \code{NA} values with placeholders.
\item \strong{Logging Missing Data (Optional):} If \code{verbose = TRUE}, prints a summary of missing values.
}
}
\examples{
library(finna)
sibelius_data <- search_finna("sibelius")
refine_metadata(sibelius_data, fill_na = TRUE, verbose = TRUE)

}
