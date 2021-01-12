data<-Salary_Data
#visuvalisation
boxplot(Salary_Data$YearsExperience)
boxplot(Salary_Data $Salary)
#regression equation
model<-lm(Salary~YearsExperience,data=Salary_Data)
summaryp(model)
#prediction of salary hike
pred<-predict(model)
pred
#prepare new data frme with predict salary hike
data2<-data.frame(Salary_Data[,-2],pred)
data2
plot(data2,cex=0.5)
plot(data,cex=0.5)
