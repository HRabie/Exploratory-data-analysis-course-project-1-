
## Plot 4 

#loading the dataset into R
data <- read.table("~/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Using data from the dates 2007-02-01 and 2007-02-02
test=data[data$Date %in% c("1/2/2007","2/2/2007") ,]

test$Date <- as.Date(test$Date, format="%d/%m/%Y")


## Converting dates
testtime <- paste(as.Date(test$Date), test$Time)
test$testtime <- as.POSIXct(testtime)

## Plot 4
png("Plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(test, {
  plot(Global_active_power~testtime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~testtime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~testtime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~testtime,col='Red')
  lines(Sub_metering_3~testtime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~testtime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


dev.off()
