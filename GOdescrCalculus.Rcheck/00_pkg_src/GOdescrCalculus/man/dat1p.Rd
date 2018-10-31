\name{dat1p}
\alias{dat1p}
\docType{data}

\title{
A sample data object
}

\description{
The dataset for this test is a data frame
}

\usage{data("dat1p")}

\format{
  A list of two objects
  \describe{
    \item{datasetURI}{a character vector- ambit data set uri}
    \item{dataEntry}{a data frame containing two columns: compound and values. Compound is a character vector with all compound anbit uris, and values is a proteomics data frame with all numberic values of the data set (compounds by features) }
  }
}

\details{
Data set for prediction with dat1m
}

\source{
The source of this function is in the
}

\references{
There are no references
}

\examples{
data(dat1p)
## maybe str(dat1p) ; plot(dat1p) ...
}

\keyword{datasetsp}
