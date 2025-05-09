% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_for_offline.R
\name{save_for_offline}
\alias{save_for_offline}
\title{Save 'Finna' Search Results for Offline Access}
\usage{
save_for_offline(data, file_name = "offline_search_results")
}
\arguments{
\item{data}{A tibble or data frame containing the 'Finna' search results.}

\item{file_name}{A string representing the name of the file to save.
The function automatically appends ".rds" to the name if not already included.}
}
\value{
No return value. Called for its side effects of saving the data to a file.
}
\description{
This function saves 'Finna' search results and metadata locally to a file in \code{.rds} format,
allowing users to access and analyze the data offline without an internet connection.
}
\examples{
\dontrun{
search_results <- search_finna("sibelius")
save_for_offline(search_results, "sibelius_search_results")
}
}
