ht=read.csv(file.choose())
#variance test
stacked=stack(ht)
stacked
library(car)
leveneTest(stacked$values~stacked$ind,data=stacked)
#reject null hypothesis
