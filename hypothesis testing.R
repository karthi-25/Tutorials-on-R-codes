#one sample t-test
x<-c(0.593,0.142,0.329,0.691,0.231,0.793,0.519,0.392,0.418)
t.test(x,alternative='greater',mu=0.3)
#two sample t-test
x1<-c(91,87,99,77,88,91)
x2<-c(101,110,103,93,99,104)
t.test(x1,x2.alternative='two.sided')
