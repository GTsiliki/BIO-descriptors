generate.descr.hierar <-
function(dataset,rawModel,additionalInfo){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #rawModel:= ? 
    #returns in additionalInfo the system names of properties (proteins)
    #additionalInfo:= FOR LM MODEL what are the features used for setting the model,
    #data frame with 2 columns: 1st  ModelCoef giving the dummy coefficient names produced for independent
    #features in the model, and 2nd RealFeatureNames which are ambit's feature names
    
    
    d1<- read.in.json.for.pred(dataset,rawModel,additionalInfo)
    prot.data<- d1$x.mat
    parameters<- d1$model#key='UNIPROT',onto=c('GO','MF'),pvalCutoff=0.05,nclust=c(5,4),FUN=mean)
    adInfo<- d1$additionalInfo
    
    
    #prot.data:=data frame with proteomics data, columns are dependent feature (1st) and proteins (remaining)
    #we only need the column protein names, a character vector of UNIPROT/SwissProt ids 
    #key:= character sring for protein names id, default value is 'UNIPROT'
    #onto:= character vector showing the ontology and sub.ontologies used. Default value is c('GO','MF') 
    #pvalCutoff:= numeric value for hypergeometric p-values cutoff. Default value is 0.05.
    #nclust:= numeric vector indicating the number of clusters for GOs(x axis) and proteins (y axis). Default value c(5,4). 
    #FUN:= string, R function to summarize vector's groups
    
    #returns matrix with descriptors (one per class label in class.cprot.labels produced by biclustering for y axis (proteins))
    
    
    
    #steps:
    #a. produce binary go.table (kegg.table)
    #b. map protein ids (SwissProt/UNIPROT) to entrez ids & gene symbols
    #c. filter go.table using hypergeometric stats and pvalCutoff
    #d. cluster go.tab to find cluster ids for each protein
    #e. summarize prot.data to produce new descriptors using FUN
    
    prot.ids<- colnames(prot.data)
    unip.go<- select(org.Hs.eg.db, columns=c("GO"), 
                     keys= prot.ids, keytype=parameters$key)#"UNIPROT")#g stands for go
    
    unip.go11<- as.data.frame(unip.go[1:dim(unip.go)[1],])
    go.idx<- duplicated(unip.go11[,1:2])
    unip.go11<- unip.go11[which(go.idx!=TRUE),1:2]
    
    go.tab1<- table(unip.go11$GO,unip.go11$UNIPROT)#matrix of 0-1s
    
    rm(unip.go,unip.go11,go.idx)
    
    #step a. construct binary GO x UNIPROT table
    rb.go.tab1<- go.tab1
    
    
    #step b. map protein ids (SwissProt/UNIPROT) to entrez ids & gene symbols
    #gids, gnam
    unip.gid<- select(org.Hs.eg.db, columns=c("ENTREZID",'SYMBOL'), 
                      keys= prot.ids, keytype=parameters$key)#"UNIPROT")
    gids<- unique(unip.gid$ENTREZID)
    gids<- gids[which(gids!='NA')]
    gnam<- unique(unip.gid$SYMBOL)
    gnam<- gnam[which(gnam!='NA')]
    
    
    #step c. filter out non-significant genes
    frame = toTable(org.Hs.egGO)# MAYBE LATER include in parameters
    #frame.om<- toTable(org.Hs.egOMIM)
    goframeData = data.frame(frame$go_id, frame$Evidence, frame$gene_id)
    
    goFrame=GOFrame(goframeData,organism="Homo sapiens")# MAYBE LATER include in parameters
    goAllFrame=GOAllFrame(goFrame)
    
    gsc <- GeneSetCollection(goAllFrame, setType = GOCollection())
    
    universe = Lkeys(org.Hs.egGO)
    my.ontol.choice<- c("MF","BP","CC")
    my.onto.res<- vector("list", length(my.ontol.choice))
    names(my.onto.res)<- my.ontol.choice
    for(i in 1:length(my.ontol.choice)){
        params <- GSEAGOHyperGParams(name="My Custom GSEA based annot Params",
                                     geneSetCollection=gsc,
                                     geneIds = gids,
                                     universeGeneIds = universe,
                                     ontology = my.ontol.choice[i],
                                     pvalueCutoff = parameters$pvalCutoff,
                                     conditional = FALSE,
                                     testDirection = "over")
        
        Over <- hyperGTest(params)
        sum.go<- summary(Over,htmlLinks=TRUE)#perilamvanei ola ta GO me p-val<0.05
        
        #plot(goDag(Over))
        #dat.html<- htmlReport(Over)
        
        description(Over)
        name1<- my.ontol.choice[i]
        my.onto.res[[i]]<- sum.go
        
    }
    
    
    imp.gos<- my.onto.res
    imp.gos<- get(parameters$onto[2],imp.gos)#'MF'
    imp.gos.n<- paste(paste(parameters$onto[1],parameters$onto[2],sep=''),'ID',sep='')
    imp.gos.ids<- get(imp.gos.n,imp.gos)#imp.gos$MF$GOMFID#!!! can I use onto[1] instead?
    
    
    #step d. cluster proteins
    if(length(imp.gos.ids)!=0){
        sig.idx<- which(imp.gos.ids %in% rownames(rb.go.tab1))
        rb.go.tab1<- rb.go.tab1[sig.idx,]
        rm(sig.idx)
    }
    
    set.seed(15)
    d <- vegdist(t(rb.go.tab1),method = parameters$distMethod,binary=TRUE)#"euclidean"#manhattan
    
    fit <- hclust(d, method=parameters$hclustMethod)#"ward.D2")
    q1<- parameters$nORh
    if(is.numeric(q1)==TRUE){
        class.cprot.Hlabels<- as.vector(cutree(fit,k=q1))
    }else{
        class.cprot.Hlabels<- as.vector(cutree(fit,h=get(q1)(fit$height)))#mean
    }
    
    rm(d,fit)
    
    if(length(class.cprot.Hlabels)!=0){
        class.cprot.labels<- class.cprot.Hlabels
        
        
        #e. summarize tabel to produce descriprors using FUN
        class.go<- sort(unique(class.cprot.labels))
        clust.names<- paste('clust.go.sep',class.go,sep='')
        clust.descr<- matrix(0,dim(prot.data)[1],length(class.go))
        colnames(clust.descr)<- clust.names
        rownames(clust.descr)<- rownames(prot.data)
        
        for(i in 1:length(class.go)){
            idx.class<- which(class.cprot.labels==class.go[i])
            if(length(idx.class)>1){
                prot.f<- prot.data[,idx.class]
                clust.descr[1:dim(clust.descr)[1],i]<- apply(prot.f,1,
                                                             function(x)(get(parameters$FUN)(x,na.rm=T)))
                #FUN)#function(x)quantile(x,probs=0.75))
                #function(x){FUN(which(x==class.cprot.labels[i]))})
            }else{
                clust.descr[1:dim(clust.descr)[1],i]<- prot.data[,idx.class]
            }
        }
        
    }else{
        stop('Probable reason for interaption: too many clusters specified.
             Please specify a lower number of clusters in parameters$nclust.')
    }
    
    return(as.data.frame(clust.descr))
    }
