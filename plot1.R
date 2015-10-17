

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="myfulldat.zip", method="curl")
unzip ("myfulldat.zip", exdir = ".", overwrite=T)

dfn<-"household_power_consumption.txt"
#read data and subset
dfull<- read.table(dfn, header=TRUE, na.strings="?", sep=";")
subdat<- dfull[(dfull$Date=="1/2/2007" | dfull$Date=="2/2/2007"), ]

#spot check the array
#print(subdat$Global_active_power[10])

# Plot the first chart
hist(subdat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

# export to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

dfull<-NULL
subdat<-NULL
file.remove(dfn)
#the end