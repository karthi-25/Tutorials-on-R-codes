#load data
book=book
book
#libraries
install.packages("arules")
install.packages("arulesViz")
library(arulesViz)
library(arules)
#association algorithm
rules=apriori(book)
arules::inspect(rules)
#apriori algorithm
rules_book=apriori(as.matrix(book),parameter=list(support=0.02,confidence=0.5))
rules_book
inspect(head(sort(rules_book,by="lift")))
inspect(head(sort(rules_book,by="confidence")))
inspect(head(sort(rules_book,by="support")))
inspect(head(sort(rules_book,by=c("count","lift"))))
#visuvalisation
plot(rules_book,method="scatterplot",jitter=0)
plot(rules_book,method="paracoord")
plot(rules_book,method="matrix")
#using different support and confidence
book_rules2=apriori(as.matrix(book),parameter=list(support=0.01,confidence=0.7,minlen=4))
book_rules2
inspect(head(sort(book_rules2,by="lift")))
inspect(head(sort(book_rules2,by="confidence")))
inspect(head(sort(book_rules2,by="support")))
inspect(head(sort(book_rules2,by=c("count","lift"))))
plot(book_rules2,jitter=0)
plot(book_rules2,method="paracoord")
