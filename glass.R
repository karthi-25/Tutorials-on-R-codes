#load data
glass=read.csv(file.choose())
View(glass)
str(glass)
summary(glass)
describe(glass)
glass$RI=as.factor(glass$RI)
glass$Na=as.factor(glass$Na)
glass$Mg=as.factor(glass$Mg)
glass$Al=as.factor(glass$Al)
glass$Si=as.factor(glass$Si)
glass$K=as.factor(glass$K)
glass$Ca=as.factor(glass$Ca)
glass$Ba=as.factor(glass$Ba)
glass$Fe=as.factor(glass$Fe)
glass$Type=as.factor(glass$Type)
str(glass)
prop.table(table(glass$Type))*100
#seperate the data into train and test
glasses=createDataPartition(type,p=0.70,list=F)
glass_train=glass[glasses,]
glass_test=glass[-glasses,]
#create the labels for the train and test
glass_train_labels=glass[glasses,10]
glass_test_labels=glass[-glasses,10]
glass_test_labels
set.seed(100)
#build the model
model=knn(train=glass_train,test=glass_test,cl=glass_train_labels,k=10)
summary(model)
mean(model==glass_test_labels)
    