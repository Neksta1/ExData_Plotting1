#code for plot2

HouseholdData <- read.table("./household_power_consumption.txt", sep=";", 
                            header = TRUE, na.strings=c("NA", "-", "?"))
HouseholdData$timestamp <- strptime(paste(HouseholdData$Date, HouseholdData$Time), 
                                    "%d/%m/%Y %H:%M:%S")
datasubset <- subset(HouseholdData, timestamp >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & 
                             timestamp < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))

png(filename="./figure/plot2.png",
    width = 480, height = 480, bg = "transparent", type = "cairo-png")
plot(datasubset$timestamp, datasubset$Global_active_power,
     type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()