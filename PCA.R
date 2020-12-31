#load data
data<-PCA
#scale the data
data1<-scale(data[,2:7])
data1
#apply PCA algorithm
pca=princomp(data1,scores=TRUE)
summary(pca)
