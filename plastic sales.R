library(timeSeries)
library(forecast)
plastic=read.csv(file.choose())
View(plastic)
str(plastic)
plot(plastic$Sales,type='o')
plot(log(plastic$Sales),type='o')
summary(plastic)
#preprocessing
#create dummies
month=data.frame(outer(rep(month.abb,length=60),month.abb,"==")+0)
colnames(month)
View(month)
plastic2=cbind(plastic,month)
View(plastic2)
plastic2["log1"]=log(plastic$Sales)
plastic2["time1"]=1:60
plastic2["time1_sq"]=(plastic2$time1)*(plastic2$time1)
#splitting data into trainng and testing
train=plastic2[1:54,]
test=plastic2[54:60,]
test
#build the linear model
linear_model=lm(Sales~time1,data=train)
summary(linear_model)
linear_pred=data.frame(predict(linear_model,test,interval = "predict"))
linear_model_rmse <- sqrt(mean((linear_pred$fit-test$Sales)^2,na.rm = T))
linear_model_rmse                   
#expomodel
exp_model=lm(log1~time1,data = train)
summary(exp_model)
exp_pred=data.frame(predict(exp_model,test,interval="predict"))
exp_model_rmse=sqrt(mean((exp_pred$fit-test$Sales)^2))
exp_model_rmse
#quadmodel
quad_model=lm(Sales~time1+time1_sq,data=train)
quad_pred=data.frame(predict(quad_model,test,interval = "predict"))
quad_model_rmse=sqrt(mean((quad_pred$fit-test$Sales)^2))
quad_model_rmse

#additive seasonality 
add_seas <- lm(Sales~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,data = train)
summary(add_seas)                     
add_seas_pred <- data.frame(predict(add_seas,interval = "predict",newdata = test))
add_seas_rmse <- sqrt(mean((test$Sales-add_seas_pred$fit)^2,na.rm = T))
add_seas_rmse                         

#additive seasonality with linear
add_seast <- lm(Sales~time1+X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,data = train)
summary(add_seast)                     
add_seast_pred <- data.frame(predict(add_seast,interval = "predict",newdata = test))
add_seast_rmse <- sqrt(mean((test$Sales-add_seast_pred$fit)^2,na.rm = T))
add_seast_rmse                         

#additive seasonality with quadratic 
add_seasq <- lm(Sales~time1+time1_sq+X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,data = train)
summary(add_seasq)                     
add_seasq_pred <- data.frame(predict(add_seasq,interval = "predict",newdata = test))
add_seasq_rmse <- sqrt(mean((test$Sales-add_seasq_pred$fit)^2,na.rm = T))
add_seasq_rmse                         

# multiplicative seasonality
mul_seas_model <- lm(log1~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,data = train)
summary(mul_seas_model)                
mul_seas_pred <- data.frame(predict(mul_seas_model,interval = 'predict',newdata = test))
mul_seas_rmse <- sqrt(mean((test$Sales-mul_seas_pred$fit)^2,na.rm = T))
mul_seas_rmse                          

#multiplicative seasonality with linear
mul_seast_model <- lm(log1~time1+X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,data = train)
summary(mul_seast_model)                
mul_seast_pred <- data.frame(predict(mul_seast_model,interval = 'predict',newdata = test))
mul_seast_rmse <- sqrt(mean((test$Sales-mul_seast_pred$fit)^2,na.rm = T))
mul_seast_rmse                          
View(month)
table_formate <- data.frame(c("linear_model_rmse","exp_model_rmse","quad_model_rmse","add_seas_rmse","add_seasq_rmse","add_seast_rmse","mul_seas_rmse","mul_seast_rmse"),c(linear_model_rmse,exp_model_rmse,quad_rmse,add_seas_rmse,add_seasq_rmse,add_seast_rmse,mul_seas_rmse,mul_seast_rmse))
colnames(table_formate)=c("model","RMSE")
View(table_formate)
final_model <- lm(Sales~time1+time1_sq+X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,data = plastic2)
final_model
summary(final_model)
