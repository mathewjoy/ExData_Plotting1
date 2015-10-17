#exdata - project wk 1
#workig directory 
setwd('/home/oracle/coursera/datasc_expldata/ExData_Plotting1')
pkgs<-installed.packages()[,c("Package")]
if (! "sqldf" %in% pkgs){
  install.packages('sqldf')  
}

library(sqldf)
library(data.table)

dfname <- "household_power_consumption.txt"
dtfull <- read.csv2(dfname,sep=';')
class(dtfull)
#View(dtfull$Date)
xxx$x<- as.Date(as.character(dtfull$Date[10], format = '%m/%d/%Y'),'%m/%d/%Y')
print(class(xxx$x))
#View(dtfull)

print(xxx$x[10])

#print(names(dtfull))
#dt<- sqldf("select * from dtfull where Date ='1/2/2007' or Date = '2/2/2007'  ")
dt1<-sqldf("select * from jt where jdt > date('2007-02-01') and jdt < date('2007-02-02')")

#dt <- sqldf("select * from dtfull where Date = '2007-02-01'")
#dt<-dtfull[dtfull[[1]]] == filterdt1]
View(dt1)