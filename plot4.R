#code for plot4

HouseholdData <- read.table("./household_power_consumption.txt", sep=";", 
                            header = TRUE, na.strings=c("NA", "-", "?"))
HouseholdData$timestamp <- strptime(paste(HouseholdData$Date, HouseholdData$Time), 
                                    "%d/%m/%Y %H:%M:%S")
datasubset <- subset(HouseholdData, timestamp >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & 
                             timestamp < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))

png(filename="./figure/plot4.png",
    width = 480, height = 480, bg = "transparent", type = "cairo-png")
par(mfrow = c(2,2))
plot(datasubset$timestamp, datasubset$Global_active_power,
     type = "l", ylab = "Global Active Power", xlab ="")
plot(datasubset$timestamp, datasubset$Voltage,
     type = "l", ylab = "Voltage", xlab ="datetime")
plot(datasubset$timestamp, datasubset$Sub_metering_1,
     type = "l", ylab = "Energy sub metering", xlab ="")
lines(datasubset$timestamp, datasubset$Sub_metering_2,
      type = "l", ylab = "Energy sub metering", xlab ="",
      col="red")
lines(datasubset$timestamp, datasubset$Sub_metering_3,
      type = "l", ylab = "Energy sub metering", xlab ="",
      col="blue")
legend("topright", paste("Sub_metering_", 1:3, sep=""), lty = 1, col = c("black", "red", "blue"), bty = 'n')
plot(datasubset$timestamp, datasubset$Global_reactive_power,
     type = "l", ylab = "Global_reactive_power", xlab ="datetime")
dev.off()