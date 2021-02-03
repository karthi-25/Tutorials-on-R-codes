library(ROCR)
library(pROC)
#load data
bank1=read.csv(file.choose(),sep = ';')
View(bank1)
dim(bank1)
colnames(bank1)
str(bank1)
ggplot(data=bank1,aes(x=y,y=duration,fill=y))+
  geom_boxplot()+
  ggtitle("Box Plot")
sum(is.na(bank1))
#create dummy
library(fastDummies)
bank.dummy1 <- dummy_cols(bank1, select_columns = c("job", "marital", "education", "contact", 
                                                  "month", "poutcome", "default", "housing", "loan", "y"), 
                         remove_first_dummy = TRUE, remove_selected_columns = TRUE)
View(bank.dummy1)
dim(bank.dummy1)
#bbuild the logistics regression
logit=glm(y_yes~.,family=binomial,data = bank.dummy)
summary(logit)
#to detect probability value
prob=predict(logit,type=c("response"),data=bank.dummy1)
prob
#confusion matrix
confusion=table(prob>0.5,bank.dummy1$y_yes)
confusion
#acc
acc=sum(diag(confusion))/sum(confusion)
acc*100
bank1.rocrpred=prediction(prob,bank.dummy1$y_yes)
bank1.rocrpref=performance(bank1.rocrpred,'tpr','fpr')
plot(bank1.rocrpref)
auc=auc(bank.dummy1$y_yes~prob)
auc
