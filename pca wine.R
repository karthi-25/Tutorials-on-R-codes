#load data
T1=wine
str(wine)
#to find na values
sum(is.na(T1))
#so there is no null values
plot(wine)
T2=scale(T1)
T2
#need to apply PCA
pca=princomp(T2,scores=TRUE)
summary(pca)
pca$scores
#Hiracheal clustering
library(factoextra)
d=dist(T2,method='euclidean')
d
#build the clustering algorithm
fit=hclust(d,method='average')
plot(fit)
#represent it into dendrogram
fviz_dend(fit,cex=0.5)
#cut into four trees
fviz_dend(fit,cex=0.5,k=3,colours_label_by_k=TRUE,rect=TRUE)
clusters=cutree(fit,k=3)
clusters
#attach cluster to orignal data
final_data=data.frame(clusters,T2)
final_data
#kmeans clustering
library(factoextra)
#elbow method to find k value
fviz_nbclust(T2,kmeans,"wss")
#kmeans algorithm
km=kmeans(T2,3)
km$cluster
km$centers
#add the values into new data
clust=data.frame(T1,3)
clust
