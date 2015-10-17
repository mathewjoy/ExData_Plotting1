

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

# Plot the third chart
multi.par <- par(mfrow=c(2,2))
with(
  subdat,{
  plot(Global_active_power~DateTime, type="l", 
       xlab="", 
       ylab="Global Active Power (kilowatts)", 
       col="black", 
       cex.sub=0.8
  )
  plot(Voltage~DateTime, type = "l",
       xlab="datetime",
       ylab="Voltage (volt)",
       cex=0.8
       )
  plot(Sub_metering_1~DateTime, type="l", 
       xlab="", 
       ylab="Global Active Power (kilowatts)", 
       col="black", 
       cex.sub=0.8
       )
  lines(Sub_metering_2~DateTime, type="l",
        col="red")
  lines(Sub_metering_3~DateTime, type="l",
        col="blue")
  #legend("top",
  #       col=c("black","red","blue"),
  #       lty=1, lwd=1,
  #       legend=c("Sub_mtr_1","Sub_mtr_2","Sub_mtr_3"),
  #       cex=0.8
  #)
  
  plot(Global_reactive_power~DateTime, type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
  }
)
par(multi.par)

# export to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

dfull<-NULL
subdat<-NULL
file.remove(dfn)
#the end