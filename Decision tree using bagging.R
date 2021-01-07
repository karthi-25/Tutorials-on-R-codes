install.packages("ipred")
library(ipred)
data1=iris
#to get the consistent results
set.seed(7)
#seperate the whole data into training and testing
seperation=createDataPartition(iris$Species,p=.70,list=F)
training=iris[seperation,]
testing=iris[-seperation,]
#building the algorithm for training data set
mybag<-bagging(Species~.,data= training,nbag=15)
summary(mybag)
#predict for the testing data set using model
pred=predict(mybag,testing)
pred
#confusion matrix
a=table(pred,testing$Species)
a
#acc
acc=sum(diag(a)/sum(a))
acc
plot(mybag)
