install.packages('arules')
library(arules)
#load data
data<-Titanic
sum(is.na(data))
nrow(data)
ncol(data)
data
#apply association algorithm
rules<-apriori(data)
arules::inspect(rules)
#arrange the lift column
rules.sorted<-sort(rules,by='lift')
arules::inspect(rules.sorted)
#rules with containg "rhs" survived only
rules<-apriori(titanic,parameter=list(support=0.1,confidence=0.2,appearence=list(rhs=c("survived=no,survived=yes")))

               