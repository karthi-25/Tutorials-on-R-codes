install.packages("caret",dependencies = TRUE)
install.packages("randomforest")
library(caret)
library(randomForest)
model=randomForest(iris$Species~.,data=iris,ntree=50)
print(model)
#importance of lower gini variable
print(importance(model))
pred=predict(model,iris[,-5])
pred
table(pred,iris$Species)
