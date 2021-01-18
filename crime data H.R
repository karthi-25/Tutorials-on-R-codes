#load data
mydata=crime_data
mydata
#data standardisatio
mydata1=scale(mydata[,2:5])
data.frame (mydata1)
#need to find the distance
d<-dist(mydata1,method="euclidean")
d
install.packages('factoextra')
library(factoextra)
fix=hclust(d,method='average')
plot(fix)
#to represent in dendrogram
fviz_dend(fix,cex=0.5)
#cut into 2 groups
fviz_dend(fix,k=2,cex=0.5,colours=label_by_k,rect=TRUE)
#we need the values of cluster
clusters=cutree(fix,k=2)
clusters
#combine the clusters into the final data
final_data=data.frame(mydata,clusters)
final_data
