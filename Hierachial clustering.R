install.packages('factoextra')
library('factoextra')
#load data
data<-Universities
#data standarsation
mydata<-scale(data[,2:7])
mydata
#need to find distance eucliden distance
d=dist(mydata,method='euclidean')
d
#build the cluster algorithm
fit=hclust(d,method='average')
fit
plot(fit)
#dendrogram representation
fviz_dend(fit,cex=0.5)
#cut that dendrogram into four parts
fviz_dend(fit,k=4,cex=0.5,colour_label_by_k=TRUE,rect=TRUE)
clusters=cutree(fit,k=4)
clusters
#combine cluster with the orginal data
final_data=data.frame(Universities[,1],clusters)
final_data
