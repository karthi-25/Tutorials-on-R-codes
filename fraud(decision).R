Fraud<-read.csv(file.choose())
View(Fraud)
library(C50)
library(gmodels)
library(party)
library(caret) 
#EDA
sum(is.na(Fraud))

#we convert numerical values into categories#
tex_cat<-ifelse(Fraud$Taxable.Income <=30000, "Risky","Good")
tex_cat
Fraud<-data.frame(Fraud[,-3],tex_cat)
str(Fraud)
 


#spiliting

Fraud_train<-Fraud[1:450,]
Fraud_test<-Fraud[451:600,]

prop.table(table(Fraud_train$tex_cat))
prop.table(table(Fraud_test$tex_cat))

#Building Model on Training data set#
Fraud_train$tex_cat=as.factor(Fraud_train$tex_cat)
Fraud_test$tex_cat=as.factor(Fraud_test$tex_cat)
tex_train<-C5.0(Fraud_train[,-6],Fraud_train$tex_cat)
plot(tex_train)
#training Accuracy#
pred_train<-predict(tex_train,Fraud_train)
#confusion matrix 
confusionMatrix(pred_train,Fraud_train$tex_cat)

mean(pred_train==Fraud_train$tex_cat) #0.77#

##predicting on test data#
pred_test<-predict(tex_train,newdata = Fraud_test)
table(pred_test,Fraud_test$tex_cat)
#cross table for comparison#
CrossTable(Fraud_test$tex_cat,pred_test)
mean(pred_test==Fraud_test$tex_cat) ##accuracy=0.775#
#model using rpart
library(rpart)
model2<-rpart(Fraud_train$tex_cat~.,Fraud_train)
summary(model2)
#on using training data set
train2=predict(model2,Fraud_train)
#build model using testing data set
model3<-C5.0(Fraud_train[,-6],Fraud_train$tex_cat)
summary(model3)
pred=predict(model3,Fraud_test)
a=table(pred,Fraud_test$tex_cat)
a
#acc
acc=(diag(a)/(sum(a)))
acc











