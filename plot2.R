

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="myfulldat.zip", method="curl")
unzip ("myfulldat.zip", exdir = ".", overwrite=T)

dfn<-"household_power_consumption.txt"
#read data and subset
dfull<- read.table(dfn, header=TRUE, na.strings="?", sep=";")
subdat<- dfull[(dfull$Date=="1/2/2007" | dfull$Date=="2/2/2007"), ]

#spot check the array
print(subdat$Global_active_power[10])

#fix the date in the right format - a pain
subdat$Date<- as.Date(subdat$Date, format="%d/%m/%Y")
subdat$DateTime<- as.POSIXct(paste(subdat$Date, subdat$Time))

#spot check the array
print(subdat$DateTime[10])

# Plot the second chart
plot(subdat$Global_active_power~subdat$DateTime, type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     col="black", 
     cex.sub=0.8
     )

# export to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

dfull<-NULL
subdat<-NULL
file.remove(dfn)
#the end