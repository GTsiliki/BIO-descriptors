\name{generate.descr.hierar}
\alias{generate.descr.hierar}

\title{
Produce GO descriptors using hierarchical clustering algorithm
}

\description{This function is used to estimate GO descriptors for omics data, based on GO ontology. Data are clustered based on hierarchical clustering algorithm from vegan R package using default values. The user needs to specify the number of clusters, the distance matrix method, and the hierarchical clust method. 
}

\usage{
generate.descr.hierar(dataset, rawModel, additionalInfo)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataset}{ Data for prediction. A list of two objects: datasetURI (a character string ), dataEntry (a data frame).}
  \item{rawModel}{A serialized list of parameters for hierarchical clustering, as produced by generate.param.model}
  \item{additionalInfo}{Any additional information needed for rawModel. Here an empty list.}
}

\details{ No details required }

\value{A data frame giving the new GO descriptors given the function's parameters. Number of columns are the number of new GO descriptors, number of rows is the number of features used.}

\references{The help file of skeleton }

\author{ Georgia Tsiliki }

\note{ No notes for this function }

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m2")

adInfo<- list()

pred.res<- generate.descr.hierar(dat1p, dat1m2, adInfo) 

}

\keyword{ generateHierar }
