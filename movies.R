library(arules)
install.packages("corrplot")
library(corrplot)
#load data
movies=read.csv(file.choose())
movies
head(movies)
summary(movies)
str(movies)
corrplot(cor(movies[,6:15]))
#build algorithm
movies_rules <- apriori(as.matrix(movies[,6:15]),parameter = list(support = 0.005,confidence= 0.05,minlen=3))
movies_rules
inspect(head(sort(movies_rules,by="lift")))
inspect(head(sort(movies_rules,by="confidence")))
inspect(head(sort(movies_rules,by="support")))
inspect(head(sort(movies_rules,by=c("count","lift"))))
