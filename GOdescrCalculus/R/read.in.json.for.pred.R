read.in.json.for.pred <-
function(dataset,rawModel,additionalInfo){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #rawModel:= serialized raw model for prediction - nly contains parameters for clustering
    #additionalInfo:= ? 
    #returns in additionalInfo the system names of properties (proteins)
    #FOR LM MODEL what are the features used for setting the model,
    #data frame with 2 columns: 1st  ModelCoef giving the dummy coefficient names produced for independent
    #features in the model, and 2nd RealFeatureNames which are ambit's feature names
    
    dat1.t<- dataset$dataEntry[,2]#$featureValues # data table
    dat1.n<- colnames(dat1.t)#dat1.n<- unlist(strsplit(colnames(dat1.t),'/'))
    names1<- lapply(strsplit(dat1.n,'/'),unlist)
    names2<- unlist(lapply(names1,function(x)(return(x[length(x)]))))
    rm(names1)
    
    colnames(dat1.t)<- names2
    
    dat1.m<- rawModel
    dat1.m<- base64Decode(dat1.m,'raw')
    dat1.model<- unserialize(dat1.m)
    
    return(list(x.mat=dat1.t,model=dat1.model,additionalInfo=data.frame(dat1.n)))
    
}
