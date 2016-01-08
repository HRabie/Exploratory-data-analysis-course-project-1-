
## Plot 2 

#loading the dataset into R
data <- read.table("~/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Using data from the dates 2007-02-01 and 2007-02-02
test=data[data$Date %in% c("1/2/2007","2/2/2007") ,]

test$Date <- as.Date(test$Date, format="%d/%m/%Y")


## Converting dates
 testtime <- paste(as.Date(test$Date), test$Time)
 test$testtime <- as.POSIXct(testtime)
 
 ## Plot 2
 png("Plot2.png", width=480, height=480)
   plot(test$Global_active_power~test$testtime, type="l",
      ylab="Global Active Power (kilowatts)", xlab="")
 dev.off()
