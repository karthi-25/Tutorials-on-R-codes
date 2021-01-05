install.packages("caret")
install.packages("C50")
library(caret)
library(C50)
#load data
data=iris
data
#to get the consistent results
set.seed(7)
#seperate the whole data into training and testing
seperation=createDataPartition(iris$Species,p=.70,list=F)
training=iris[seperation,]
testing=iris[-seperation,]
#model building using training data set
model=C5.0(Species~.,data= training)
#summarise the model
summary(model)
#predict for the testing data set by using the model
pred=predict.C5.0(model,testing[,-5])
pred
testing$Species
#to find the accuracy of the model
a=table(testing$Species,pred)
a
#acc
acc=sum(diag(a)/sum(a))
acc
#tree plot
plot(model)
