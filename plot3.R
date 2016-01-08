
## Plot 3 

#loading the dataset into R
data <- read.table("~/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Using data from the dates 2007-02-01 and 2007-02-02
test=data[data$Date %in% c("1/2/2007","2/2/2007") ,]

test$Date <- as.Date(test$Date, format="%d/%m/%Y")


## Converting dates
testtime <- paste(as.Date(test$Date), test$Time)
test$testtime <- as.POSIXct(testtime)

## Plot 3
png("Plot3.png", width=480, height=480)

with(test, {
  plot(Sub_metering_1~testtime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~testtime,col='Red')
  lines(Sub_metering_3~testtime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
