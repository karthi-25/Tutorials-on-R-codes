#LOAD DATA
mydata<-`NewspaperData.(1)`
#visuvalisation
boxplot(mydata$sunday)
boxplot(mydata$daily)
model<-lm(sunday~daily,data=mydata)
summary(model)
#preparing for new data set\
new_daily<-data.frame(daily=c(200,400))
#predict for sunday using new data set
sun=predict(model,new_daily)
sun
#predict all daily variable
pred<-predict(model)
pred
#combine the pred values ot orginal data
final_data<-data.frame(mydata[,-1],pred)
final_data


























