install.packages("openxlsx")
library(openxlsx)
library(factoextra)
#load data
A=read.xlsx(file.choose(),2)
#remove the first column
a=A[-1]
a
#scale the data set
a=scale(a)
a
#visuvalisation
plot(a,main="scatterplot")
qqline(a)
hist(a)
#elbow method to find K value
fviz_nbclust(a,kmeans,method="wss")
#kmeans algorithm
km=kmeans(a,8)
km
km$centers
km$cluster
clust_final=data.frame(A[,1],km$cluster)
clust_final
#H.clustering
d=dist(a,method="euclidean")
d
#build the algorithm
fit=hclust(d,method="average")
plot(fit)
fviz_dend(fit,cex=0.5,rect=TRUE)
clusters=cutree(fit,k=8)
clusters
#attach cluster to orginal data
final_data=data.frame(A,clusters)
final_data
