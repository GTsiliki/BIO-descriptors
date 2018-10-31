pkgname <- "GOdescrCalculus"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('GOdescrCalculus')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("GOdescrCalculus-package")
### * GOdescrCalculus-package

flush(stderr()); flush(stdout())

### Name: GOdescrCalculus-package
### Title: Produce GO descriptors given an omics data
### Aliases: GOdescrCalculus-package GOdescrCalculus
### Keywords: package

### ** Examples

data("dat1p")
data("dat1m1")

adInfo<- list()

res1<- read.in.json.for.pred(dat1p, dat1m1, adInfo) 



cleanEx()
nameEx("dat1")
### * dat1

flush(stderr()); flush(stdout())

### Name: dat1
### Title: A sample data object
### Aliases: dat1
### Keywords: datasets

### ** Examples

data(dat1)
## maybe str(dat1) ; plot(dat1) ...



cleanEx()
nameEx("dat1m1")
### * dat1m1

flush(stderr()); flush(stdout())

### Name: dat1m1
### Title: Serialized list of parameters for biclustering algorithm
### Aliases: dat1m1
### Keywords: datasetsm1

### ** Examples

data(dat1m1)
## maybe str(dat1m1) ; plot(dat1m1) ...



cleanEx()
nameEx("dat1m2")
### * dat1m2

flush(stderr()); flush(stdout())

### Name: dat1m2
### Title: Serialized list of parameters for hierarchical clustering
###   algorithm
### Aliases: dat1m2
### Keywords: datasetsm2

### ** Examples

data(dat1m2)
## maybe str(dat1m2) ; plot(dat1m2) ...



cleanEx()
nameEx("dat1p")
### * dat1p

flush(stderr()); flush(stdout())

### Name: dat1p
### Title: A sample data object
### Aliases: dat1p
### Keywords: datasetsp

### ** Examples

data(dat1p)
## maybe str(dat1p) ; plot(dat1p) ...



cleanEx()
nameEx("generate.descr.biclust")
### * generate.descr.biclust

flush(stderr()); flush(stdout())

### Name: generate.descr.biclust
### Title: Produce GO descriptors using bi-clustering algorithm
### Aliases: generate.descr.biclust
### Keywords: generateBiclust

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m1")

adInfo<- list()

pred.res<- generate.descr.biclust(dat1p, dat1m1, adInfo) 




cleanEx()
nameEx("generate.descr.hierar")
### * generate.descr.hierar

flush(stderr()); flush(stdout())

### Name: generate.descr.hierar
### Title: Produce GO descriptors using hierarchical clustering algorithm
### Aliases: generate.descr.hierar
### Keywords: generateHierar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m2")

adInfo<- list()

pred.res<- generate.descr.hierar(dat1p, dat1m2, adInfo) 




cleanEx()
nameEx("generate.param.model")
### * generate.param.model

flush(stderr()); flush(stdout())

### Name: generate.param.model
### Title: A 'training' function to produce a serialized list for the
###   parameters needed to produce GO descriptors
### Aliases: generate.param.model
### Keywords: generateParamModel

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1")

predF<- list()

required.param<- list(key='UNIPROT',onto=c('GO','MF'),pvalCutoff=0.05,nclust=c(3,2),FUN='mean')

params1<- generate.param.model(dat1,predF,required.param)





cleanEx()
nameEx("read.in.json.for.pred")
### * read.in.json.for.pred

flush(stderr()); flush(stdout())

### Name: read.in.json.for.pred
### Title: Read in function for json files for prediction
### Aliases: read.in.json.for.pred
### Keywords: readjsonp

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m1")

adInfo<- list()

res1<- read.in.json.for.pred(dat1p, dat1m1, adInfo) 




### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
