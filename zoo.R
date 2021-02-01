#load data
z=read.csv(file.choose())
z1=z[,-1]
z1
View(z1)
str(z1)
prop.table(table(z1$type))*100
z1$hair <- as.factor(z1$hair)
z1$feathers <- as.factor(z1$feathers)
z1$eggs <- as.factor(z1$eggs)
z1$milk <- as.factor(z1$milk)
z1$airborne <- as.factor(z1$airborne)
z1$aquatic <- as.factor(z1$aquatic)
z1$predator <- as.factor(z1$predator)
z1$toothed <- as.factor(z1$toothed)
z1$backbone <- as.factor(z1$backbone)
z1$breathes <- as.factor(z1$breathes)
z1$venomous <- as.factor(z1$venomous)
z1$fins <- as.factor(z1$fins)
z1$legs <- as.factor(z1$legs)
z1$tail <- as.factor(z1$tail)
z1$domestic <- as.factor(z1$domestic)
z1$catsize <- as.factor(z1$catsize)
z1$type <- as.factor(z1$type)
#split the data
sep=createDataPartition(z1$type,p=0.8,list=F)
z1_train=z1[sep,]
z1_test=z1[-sep,]
z1_test
z1_train
#create labels for train and test
z1_train_labels=z1[sep,17]
z1_test_labels=z1[-sep,17]
z1_test_labels
library(class)
#build the alogithm
set.seed(100)
z1_test_pred=knn(train=z1_train,test=z1_test,cl=z1_train_labels,k=30)
summary(z1_test_pred)
mean(z1_test_pred==z1$type)
  