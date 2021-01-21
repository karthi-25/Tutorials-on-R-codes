library(arules)
#load data
groceries=read.transactions(file.choose(),sep=",",format="basket")
groceries
#to find item inf0
groceries@itemInfo
#with support 0.005 and confidence 0.2
rules_g=apriori(groceries,parameter = list(support=0.005,confidence=0.2,minlen=3))
#sorting
inspect(head(sort(rules_g,by="lift")))
inspect(head(sort(rules_g,by="confidence")))
inspect(head(sort(rules_g,by="support")))
inspect(head(sort(rules_g,by=c("count","lift")))) 
#visvalisation
plot(rules_g,jitter=0)
plot(rules_g,method="paracoord")
