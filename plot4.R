setwd("R/ExploratoryDataAnalysis")
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
voltage <- as.numeric(subSetData$Voltage)
energySubMetering1 <- as.numeric(subSetData$Sub_metering_1)
energySubMetering2 <- as.numeric(subSetData$Sub_metering_2)
energySubMetering3 <- as.numeric(subSetData$Sub_metering_3)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width=1280, height=960)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(datetime, voltage, type = "l", ylab = "Voltage")

plot(datetime, energySubMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, energySubMetering2, type = "l", col = "red")
lines(datetime, energySubMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2 , col = c("black", "red", "blue"), bty = "n")

plot(datetime, globalReactivePower, type = "l", ylab = "Global_reactive_power")
dev.off()