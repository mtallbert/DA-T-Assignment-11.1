mybank =read.csv("bank-full.csv" , header = TRUE ,sep = ";")

View(mybank)
summary(mybank)
#a. Create a visual for representing missing values in the dataset.
mybank[mybank=='unknown'] = NA
#table(mybank$job)
summary(is.na(mybank))
install.packages('VIM')
library(VIM)
aggr_plot <- aggr(mybank, col=c('navyblue','red'), numbers=FALSE, sortVars=TRUE, labels=names(mybank),  ylab=c("Histogram of missing data","Pattern"))

#b. Show a distribution of clients based on a Job.
jobcount <-table(mybank$job)


barplot(height = jobcount[order(jobcount,decreasing = TRUE)] ,col = 'Red')

#c. Check whether is there any relation between Job and Marital Status?
 install.packages("gmodels")
library(gmodels)
 
CrossTable(mybank$marital, mybank$job)
ggplot(mybank,aes(mybank$marital,mybank$job)) + geom_jitter()


#d. Check whether is there any association between Job and Education?
  ggplot(mybank,aes(mybank$education,mybank$job)) + geom_jitter()



