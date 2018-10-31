generate.param.model <-
function(dataset,predictionFeature,parameters){
    #dataset:= list of 2 objects
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns,  
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #predictionFeature:= - HERE EMPTY - character string specifying which is the prediction feature in dataEntry, 
    #parameters:= list with clustering parameter values and other specifications for generate.descr.biclust(hierar)
    #for biclust:
    #key, onto, pvalCutoff, nclust (giving number of clusters in x,y axis), FUN
    #for hierarc:
    #key, onto, pvalCutoff, distMethod, hclustMethod, nORh (giving number of clusters or a function to define height),
    #FUN 
    
    d1<- dataset$dataEntry[,2]
    d1.n<- colnames(d1) 
    p1<- parameters#dat1$parameters
    p1.n<- names(p1)
    
    if(sum(match(p1.n,'nclust'),na.rm=T)>0){
        p1.nn<- paste('clust.go.sep',1:parameters$nclust[2],sep='')
    }else{
        p1.nn<- paste('clust.go.sep',1:parameters$nORh,sep='')
    }
    
    p1.ser<- serialize(p1,connection=NULL)
    #p1.pmml<- pmml(p1)
    #p1.pmml<- toString(p1.pmml)
    
    m1.ser.list<- list(rawModel=p1.ser,pmmlModel=NULL,independentFeatures=d1.n,
                       predictedFeatures=p1.nn,additionalInfo=NULL)
    
    return(m1.ser.list)
}
