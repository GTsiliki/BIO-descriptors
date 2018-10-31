\name{read.in.json.for.pred}
\alias{read.in.json.for.pred}


\title{ Read in function for json files for prediction }

\description{ This function reads in a json data file and produces a list with independent features, parameters list for GO clustering  saved as raw model}

\usage{
read.in.json.for.pred(dataset, rawModel, additionalInfo)
}

\arguments{
  \item{dataset}{ Data for prediction. A list of two objects: datasetURI (a character string ), dataEntry (a data frame) which should include an omics data set (e.g. proteomics/genomics/etc).}
  \item{rawModel}{Raw model for prediction. Here a seerilized list of parameters to be used by genrate.descr.biclust or generate.descr.hierar functions.}
  \item{additionalInfo}{ Any additional information needed for rawModel. Here an empty list.}
}

\details{ No further details required }

\value{
A List including:
  \item{x.mat }{ data frame with independent variables values (proteins/genes/ etc) }
  \item{model }{ R model (a list of parameters to be used by genrate.descr.biclust or generate.descr.hierar functions) }
  \item{additionalInfo}{Any additional information needed for rawModel. Here a data frame giving the Ambit names of the independent features included in x.mat. }
}

\references{ The help file of skeleton }

\author{ Georgia Tsiliki }

\note{ No notes for this function }


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m1")

adInfo<- list()

res1<- read.in.json.for.pred(dat1p, dat1m1, adInfo) 

}

\keyword{ readjsonp }
