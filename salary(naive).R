library(e1071)
library(corrplot)
library(gmodels)
sal_train=salary_train
sal_test=salary_test
attach(sal_train)
attach(sal_test)
sum(is.na(sal_train))
sum(is.na(sal_test))
str(sal_train)
str(sal_test)
table(sal_train$Salary)
table(sal_test$Salary)
#visvalisation
ggplot(data=sal_train,aes(x=Salary,y=age,fill=Salary))+
  geom_boxplot()+
  ggtitle("Box Plot")
ggplot(data=sal_train,aes(x=Salary,y=educationno,fill=Salary))+
  geom_boxplot()+
  ggtitle("Box Plot")
View(sal_train)
#model building
model_n=naiveBayes(sal_train$Salary~.,data=sal_train)
model_n
#predict
pred=predict(model_n,sal_test)
pred
cor(pred,sal_test$Salary)
mean(pred==sal_test$Salary)
#cross table
CrossTable(pred,sal_test$Salary,prop.chisq = FALSE,prop.t = FALSE,dnn=c('predicted','actual'))
#to increase the accuracy
model_np=naiveBayes(Salary~.,data=sal_train,laplace = 1)
model_np
pred_np=predict(model_np,sal_test)
pred_np
mean(pred_np==sal_test$Salary)
