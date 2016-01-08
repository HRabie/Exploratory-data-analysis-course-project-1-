## Plot 1 

#loading the dataset into R
data <- read.table("~/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using data from the dates 2007-02-01 and 2007-02-02
test=data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Draw plot1 
ActivePower <- as.numeric(test$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(ActivePower ,col="red", main="Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()
