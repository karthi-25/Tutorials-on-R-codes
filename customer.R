a=read_csv(file.choose())
a
library(tidyr)
#table
a2=table(gather(a,nation,status,1:4))
a2
chisq.test(a2)
#failed to reject null hypothesis