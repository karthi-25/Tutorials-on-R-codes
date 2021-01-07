library(caret)
data2=iris
set.seed(300)
#splitting the data into 10 
ctrl=trainControl(method="cv",number=10)
model_cv=train(Species~.,data=training,method="treebag",trcontrol=ctrl)
summary(model_cv)
pred<-predict(model_cv,testing)
pred
table(pred,testing$Species)
acc=sum(diag(a)/sum(a))
acc
