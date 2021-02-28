library(psych)
library(class)
library(ggplot2)
library(corrplot)
library(caret)
glass=read.csv(file.choose())
View(glass)
describe(glass)
summary(glass)
str(glass)
attach(glass)
ggplot(glass)+geom_bar(mapping = aes(x=Type))
table(Type)
cor<-cor(glass[,-10])
corrplot(cor,method="circle")
#NORMAILISATION OF THE DATA
norm <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
glass1 <- as.data.frame(lapply(glass[,-10],norm))
View(glass1)
glass2=data.frame(glass1,Type)
glass2
str(glass2)
#splitting the data into train and test
set.seed(100)
splt<-createDataPartition(Type,p=0.8,,list=F)
trn=glass2[splt,]
tst=glass2[-splt,]
#bagging method to find K value
trn_acc=c()
tst_acc=c()
for(i in seq(1,50,2)){
  set.seed(100)
  trn_model <- knn(trn,trn,cl=trn$Type,k=i)
  tst_model <- knn(trn,tst,cl=trn$Type,k=i)
  trn_acc <- c(trn_acc,mean(trn_model==trn$Type))
  tst_acc <- c(tst_acc,mean(tst_model==tst$Type))
}
trn_acc
tst_acc
acc <- data.frame(list(train=trn_acc,test=tst_acc,k=seq(1,50,2)))
acc
#visualisation of bagging method
ggplot(acc,aes(x=k))+
  geom_line(aes(y=trn_acc,colour="trn_acc"))+
  geom_line(aes(y=tst_acc,colour="tst_acc"))
# accuracy is high till k=21 for test data

model <- knn(trn,tst,k=21,cl=trn$Type)
summary(model)
pred <- mean(model==tst$Type)
pred
                