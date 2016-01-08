data <- read.table("~/Data2.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
test=data[data$Date %in% c("1/2/2007","2/2/2007") ,]
ActivePower <- as.numeric(test$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(ActivePower ,col="red", main="Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()
