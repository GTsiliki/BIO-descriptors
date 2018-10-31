\name{dat1m1}
\alias{dat1m1}
\docType{data}

\title{Serialized list of parameters for biclustering algorithm
}
\description{A character string for a serialized parameters list, i.e. a set of values needed from the biclusteruing algorithm in order to produce the GO descriptors. The list includes 'key' (e.g. 'UNIPROT'), 'onto' (e.g. c('GO','MF')), 'pvalCutoff' for hypergeometric test (e.g. 0.05),
'nclust' for the number of clusters in the x and y axis respectively (e.g c(4,2)), and 'FUN' to specify the function used to summarize the omics data (e.g. 'mean').
}

\usage{data("dat1m1")}

\format{
A character string
}

\details{
Example set of parameters needed for generate.descr.biclust function
}

\source{The source of this function is in the}

\references{
There are no references
}

\examples{
data(dat1m1)
## maybe str(dat1m1) ; plot(dat1m1) ...
}
\keyword{datasetsm1}
