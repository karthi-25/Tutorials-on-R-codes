#load data
data1<-WC_AT
boxplot(data1$Waist)
boxplot(data1$AT)
model=lm(AT~Waist,data1)
summary(model)
#build new data to AT
Waist1=data.frame(Waist=c(50))
Waist1
AT1=predict(model,Waist1)
AT1
#prediction of all values to the AT by using Waist data
pred=predict(model)
pred
#combine predicted values to the orginal data
finally=data.frame(data1,pred)
finally
