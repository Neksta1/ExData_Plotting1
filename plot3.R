#code for plot3

HouseholdData <- read.table("./household_power_consumption.txt", sep=";", 
                            header = TRUE, na.strings=c("NA", "-", "?"))
HouseholdData$timestamp <- strptime(paste(HouseholdData$Date, HouseholdData$Time), 
                                    "%d/%m/%Y %H:%M:%S")
datasubset <- subset(HouseholdData, timestamp >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & 
                             timestamp < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))

png(filename="./figure/plot3.png",
    width = 480, height = 480, bg = "transparent", type = "cairo-png")
plot(datasubset$timestamp, datasubset$Sub_metering_1,
     type = "l", ylab = "Energy sub metering", xlab ="")
lines(datasubset$timestamp, datasubset$Sub_metering_2,
      type = "l", ylab = "Energy sub metering", xlab ="",
      col="red")
lines(datasubset$timestamp, datasubset$Sub_metering_3,
      type = "l", ylab = "Energy sub metering", xlab ="",
      col="blue")
legend("topright", paste("Sub_metering_", 1:3, sep=""), lty = 1, col = c("black", "red", "blue"))
dev.off()