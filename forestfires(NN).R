library(caret)
library(neuralnet)
library(corrplot)
#load data
ff=read.csv(file.choose())
View(ff)
attach(ff)
str(ff)
table(ff$size_category)
colnames(ff)
ggplot(ff)+geom_histogram(mapping=aes(x=ff$area))
#create dummies
ff$month=as.integer(factor(ff$month,levels = c("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"),labels=c(1,2,3,4,5,6,7,8,9,10,11,12)))
ff$day=as.integer(factor(ff$day,levels=c("sun","mon","tue","wed","thu","fri","sat"),labels = c(1,2,3,4,5,6,7)))
ff$size_category=as.integer(factor(ff$size_category,levels=c("large","small"),labels=c(1,0)))
str(ff)
#normalisation
normalize= function(x){
  return((x-min(x))/(max(x)-min(x)))
}
#apply normalisation to data set
forest_norm=as.data.frame(lapply(ff, normalize))
forest_norm
View(forest_norm)
#seperation data
forest_train=forest_norm[1:350,]
forest_test=forest_norm[351:517,]
#build the model
model=neuralnet(forest_train$area~.,data = forest_train,act.fct = "logistic",stepmax=3100)
summary(model)
plot(model)
#perdiction for test data set
pred=predict(model,forest_test)
#obtain predicated strength
predicted_strength=pred
predicted_strength
#Examine the correlation matrix
cor(pred,forest_test$area)
#acc is low need to improve the model
model1=neuralnet(forest_train$area~.,data=forest_train,hidden=c(5,2))
summary(model1)
#predict for test data set
pred=predict(model1,forest_test)
#@acc
mean(pred==forest_test$area)
cor(pred,forest_test$area)
