install.packages("gmodels")# one time job  
library(gmodels)#every time we use CI
install.packages('nycflights13')
library (nycflights13)
data(flights)
dep_delay<-flights$dep_delay
#to check NA values
sum(is.na(dep_delay))
#to remove NA values
flights1<-na.omit(flights)
#to find CONFIDENCE INTERVAL
ci(flights1$dep_delay,confidence=0.95)
