\name{GOdescrCalculus-package}
\alias{GOdescrCalculus-package}
\alias{GOdescrCalculus}
\docType{package}

\title{
Produce GO descriptors given an omics data
}

\description{This package expects an omics data (e.g. proteomics/genomics), and produces a set of GO descriptors given the data and the parameters supplied based on the data and the algorirthm selected; bi-clustering and hierarchical clustering algorithms are currently implemented. The clustering algorithm parameters can be stored as an R raw model and used for 'prediction', i.e. to construct GO decsriptors for the same data.
}

\details{
\tabular{ll}{
Package: \tab GOdescrCalculus\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-04-16\cr
License: \tab GPL-2\cr
}

Generate GO descriptors given an omics data. Important functions are generate.descr.biclust and generate.descr.hierar.
}

\author{
Georgia Tsiliki

Maintainer: Georgia Tsiliki <gtsiliki@central.ntua.gr>
}

\references{Package source is in the help file for package.skeleton
}


\keyword{ package }

\examples{
data("dat1p")
data("dat1m1")

adInfo<- list()

res1<- read.in.json.for.pred(dat1p, dat1m1, adInfo) 
}
