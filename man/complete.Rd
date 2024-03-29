% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/midas_functions.R
\name{complete}
\alias{complete}
\title{Impute missing values using imputation model}
\usage{
complete(
  mid_obj,
  m = 10L,
  unscale = TRUE,
  bin_label = TRUE,
  cat_coalesce = TRUE,
  fast = FALSE,
  file = NULL,
  file_root = NULL
)
}
\arguments{
\item{mid_obj}{Object of class \code{midas}, the result of running \code{rMIDAS::train()}}

\item{m}{An integer, the number of completed datasets required}

\item{unscale}{Boolean, indicating whether to unscale any columns that were previously minmax scaled between 0 and 1}

\item{bin_label}{Boolean, indicating whether to add back labels for binary columns}

\item{cat_coalesce}{Boolean, indicating whether to decode the one-hot encoded categorical variables}

\item{fast}{Boolean, indicating whether to impute category with highest predicted probability (TRUE), or to use predicted probabilities to make weighted sample of category levels (FALSE)}

\item{file}{Path to save completed datasets. If \code{NULL}, completed datasets are only loaded into memory.}

\item{file_root}{A character string, used as the root for all filenames when saving completed datasets if a \code{filepath} is supplied. If no file_root is provided, completed datasets will be saved as "file/midas_impute_yymmdd_hhmmss_m.csv"}
}
\value{
List of length \code{m}, each element of which is a completed data.frame (i.e. no missing values)
}
\description{
Having trained an imputation model, complete() produces \code{m} completed datasets, saved as a list.
}
\details{
For more information, see Lall and Robinson (2023): \url{doi:10.18637/jss.v107.i09}.
}
\examples{
# Generate raw data, with numeric, binary, and categorical variables
\dontrun{
# Run where Python available and configured correctly
if (python_configured()) {
set.seed(89)
n_obs <- 10000
raw_data <- data.table(a = sample(c("red","yellow","blue",NA),n_obs, replace = TRUE),
                       b = 1:n_obs,
                       c = sample(c("YES","NO",NA),n_obs,replace=TRUE),
                       d = runif(n_obs,1,10),
                       e = sample(c("YES","NO"), n_obs, replace = TRUE),
                       f = sample(c("male","female","trans","other",NA), n_obs, replace = TRUE))

# Names of bin./cat. variables
test_bin <- c("c","e")
test_cat <- c("a","f")

# Pre-process data
test_data <- convert(raw_data,
                     bin_cols = test_bin,
                     cat_cols = test_cat,
                     minmax_scale = TRUE)

# Run imputations
test_imp <- train(test_data)

# Generate datasets
complete_datasets <- complete(test_imp, m = 5, fast = FALSE)

# Use Rubin's rules to combine m regression models
midas_pool <- combine(formula = d~a+c+e+f,
                      complete_datasets)
}
}

}
\references{
\insertRef{rmidas_jss}{rMIDAS}
}
\keyword{imputation}
