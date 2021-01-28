library(caret)
library(kernlab)
library(ggplot2)
fires=read.csv(file.choose())
View(fires)
str(fires)
table(fires$size_category)
ggplot(data=fires)+geom_histogram(mapping = aes(x=fires$area),binwidth = 50)
summary(fires)
sum(is.na(fires))
#create dummys for categorical columns
fires$month=as.integer(factor(fires$month,levels=c("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"),labels=c(1,2,3,4,5,6,7,8,9,10,11,12)))
fires$day=as.integer(factor(fires$day,levels=c("sun","mon","tue","wed","thu","fri","sat"),labels=c(1,2,3,4,5,6,7) ))
fires$size_category=as.integer(factor(fires$size_category,levels=c("large","small"),labels=c(1,0)))
str(fires)
corr=cor(fires)
corrplot::corrplot(corr,method=c("square"))
#normalisation
norm=function(x){
  return((x-min(x))/(max(x)-min(x)))
}
forest_norm=as.data.frame(lapply(fires,norm))
forest_norm
head(forest_norm)
#splitting the data into training and testing
set.seed(100)
seperation=createDataPartition(forest_norm$area,p=0.80,list=F)
forest_train= forest_norm[seperation,]
forest_test=forest_norm[-seperation,]
#model building
r_model=ksvm(area~.,data=forest_train,kernel="rbfdot")
pred_r=predict(r_model,newdata=forest_test)
cor(pred_r,forest_test$area)
plot(pred_r)
# vanilla
v_model=ksvm(area~.,data=forest_train,kernel="vanilladot")
pred_v=predict(v_model,newdata=forest_test)
cor(pred_v,forest_test$area)
#besseldot
b_model=ksvm(area~.,data=forest_train,kernel="besseldot")
pred_b=predict(b_model,newdata=forest_test)
cor(pred_b,forest_test$area)
#polydot
p_model=ksvm(area~.,data=forest_train,kernel="polydot")
pred_p=predict(p_model,newdata=forest_test)
cor(pred_p,forest_test$area)
#tanh
t_model=ksvm(area~.,data=forest_train,kernel="tanhdot")
pred_t=predict(t_model,newdata=forest_test)
cor(pred_t,forest_test$area)
#anovadot
a_model=ksvm(area~.,data=forest_train,kernel="anovadot")
pred_a=predict(a_model,newdata=forest_test)
cor(pred_a,forest_test$area)
#from the above the kernal "vanilladot " has the highest accuracy