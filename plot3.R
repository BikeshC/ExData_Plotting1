setwd("R/ExploratoryDataAnalysis")
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
energySubMetering1 <- as.numeric(subSetData$Sub_metering_1)
energySubMetering2 <- as.numeric(subSetData$Sub_metering_2)
energySubMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, energySubMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, energySubMetering2, type = "l", col = "red")
lines(datetime, energySubMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2 , col = c("black", "red", "blue"))
dev.off()