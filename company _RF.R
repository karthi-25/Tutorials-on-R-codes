library(caret)
library(randomForest)
library(gmodels)
#load data
company=Company_Data
company
#create dummy variable
sales=ifelse(company$Sales>8.5,"high","low")
sales
company=data.frame(company,sales)
company
#ignore first column
company=company[,c(-1,-13)]
company
str(company)
# to check null values
sum(is.na(company))
#seperation of the data
company_train=company[1:300,]
company_test=company[301:400,]
prop.table(table(company_train$sales))
prop.table(table(company_test$sales))
#convert into factor
company_train$sales=as.factor(company_train$sales)
#build the model
companyforest <- randomForest(sales~.,data = company_train,ntree=50)
#importance of the variable
print(importance(companyforest))
#prediction and acuracy based on the train data
pred_train=predict(companyforest,company_train)
pred_train
#to find accuracy
confusionMatrix(pred_train,company_train$sales)
#predication and accuracy for test data
pred_test=predict(companyforest,company_test)
pred_test
#to find accuracy
mean(pred_test==company_test$sales) 
table(pred_test,company_test$sales)
a=(diag(a))/sum(a)
a
#acc=0.81