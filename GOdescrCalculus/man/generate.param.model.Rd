\name{generate.param.model}
\alias{generate.param.model}


\title{
A 'training' function to produce a serialized list for the parameters needed to produce GO descriptors  
}

\description{
This function is used to pass on all the neccessary information to generate.descr.biclust and generate.descr.hierar functions.
}

\usage{
generate.param.model(dataset, predictionFeature, parameters)
}

\arguments{
  \item{dataset}{list of 2 objects, datasetURI:= character sring, code name of dataset, dataEntry:= data frame with 2 columns }
  \item{predictionFeature}{ character string specifying which is the prediction feature in dataEntry, here empty }
  \item{parameters}{ list with parameter values for ontology and biclustering. 5 or 7 objects should be included depending on whether we then intend to use generate.descr.biclust or generate.descr.hierar function, respectively. In the first case: 'key'a character sring for gene/protein/etc names id (for dat1 'UNIPROT' is the right key), 'onto' a character vector showing the ontology and sub.ontologies used ( c('GO','MF')), 'pvalCutoff' a numeric value for hypergeometric p-values cutoff (e.g. 0.05), 'nclust' a numeric vector indicating the number of clusters for GOs(x axis) and genes/proteins (y axis) (e.g. c(5,4)), 'FUN' a string, R function to summarize vector's groups (e.g. mean). In the second case: 'key'a character sring for gene/protein/etc names id (for dat1 'UNIPROT' is the right key), 
'onto' a character vector showing the ontology and sub.ontologies used ( c('GO','MF')), 'pvalCutoff' a numeric value for hypergeometric p-values cutoff (e.g. 0.05), 'distMethod' distance method (could be one of those provided via vegan R package), 'hclustMethod' (could be one of those provided via vegan R package)
, 'nORh' either a numeric value or character giving number of clusters or a function to define height respectively, 'FUN' a string, R function to summarize vector's groups (e.g. mean).
}
}

\details{ No details required }


\value{
\item{rawModel}{ A serialized object of the parameters list supplied.}
  \item{pmmlModel}{ A pmml GO descriptors object - now empty}
  \item{independentFeatures}{ A list with Ambit names for all genes/ proteins features included in the model }
  #item{predictedFeatures}{A character vector with dummy names for the GO descriptors that will be produced by functions generate.descr.biclust or generate.descr.hierar}
  \item{additionalInfo}{ A data frame with all independent features included in the model and their dummy name in the model - here empty }
}

\references{ The help file of skeleton }

\author{ Georgia Tsiliki}

\note{ No notes for this function }


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1")

predF<- list()

required.param<- list(key='UNIPROT',onto=c('GO','MF'),pvalCutoff=0.05,nclust=c(3,2),FUN='mean')

params1<- generate.param.model(dat1,predF,required.param)


}

\keyword{ generateParamModel }

