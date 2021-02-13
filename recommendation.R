library(plyr)
library(recommenderlab)
library(Matrix)
#load data
book_data=read.csv(file.choose())
book_data=book_data[1:2000,]
book_data
View(book_data)
book=book_data[-1]
View(book)
colnames(book)
head(book)
hist(book$Book.Rating)
table(book$Book.Rating)
#convert the data into real matrix format
book_matrix1=as(book,'realRatingMatrix')
book_matrix1@data
#user based collabrative filtering
book_recommender_model1=Recommender(book_matrix1,method="UBCF")
#predication for all users
recommended_book1=predict(book_recommender_model1,book_matrix1,n=5)
d=as(recommended_book1,"list")
df=ldply(d,data.frame)