#load data
hi<-delivery_time
#create regression model
model=lm(hi$`Delivery Time`~hi$`Sorting Time`)
summary(model)
#predict for the data set
pred=predict(model,hi)
pred
#load the pred values into final data
final_data=data.frame(pred,hi[,-2])
final_data
plot(model)
