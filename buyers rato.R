c=read_csv(file.choose())
c
#chisq test
c1=c[-1]
c1
chisq.test(c1)
#go on null hypothesis
#product sale is same for bth men and women