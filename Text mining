install.packages("tm")
library(rvest)
library(XML)
library(magrittr)
library(tm)
library(SnowballC)
library(RColorBrewer)
library(wordcloud)
# Review extraction
url <- "https://www.amazon.in/OnePlus-McLaren-Limited-256GB-Storage/product-reviews/B07HGKGDHH/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews"
amazon_reviews <- NULL
for(i in 1:10){
  murl <- read_html(as.character(paste(url,i,sep = "=")))
  rev <- murl%>%
    html_nodes(".review-text")%>%
    html_text()
  amazon_reviews <- c(amazon_reviews,rev)
}
length(amazon_reviews)
#importing amazon reviews
x=as.character(amazon_reviews)
x=iconv(x,"UTF-8")
x
#load data as corpus
x=Corpus(VectorSource(x))
inspect(x[1])
#convert text into lowercase
x1=tm_map(x,tolower)
inspect(x1[1])
#remove numbers
x1=tm_map(x1,removeNumbers)
inspect(x1[1])
#remove punctuation
x1=tm_map(x1,removePunctuation)
inspect(x1[1])
#remove english common words
x1=tm_map(x1,removeWords,stopwords('english'))
inspect(x1[2])
#specify the stop words as a character
x1=tm_map(x1,removeWords,c('one','the','will','use','phone'))
inspect(x1[3])
#remove strippen white spaces
x1=tm_map(x1,stripWhitespace)
inspect(x1[3])
#apply lematisation
x1=lemmatize_words(x1)
x1
#converting the reviews as tdm
tdm=TermDocumentMatrix(x1)
tdm=as.matrix(tdm)
tdm
#sort them out
v=sort(rowSums(tdm),decreasing=TRUE)
d=data.frame(word=names(v),frequency=v)
head(d,2)
#barplot
w=rowSums(tdm)
barplot(w,las=3,col = rainbow(20))
#wordcloud
wordcloud(words = names(w),freq = w,random.order = F,rot.per = 0.3)
