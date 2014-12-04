#code for plot1

HouseholdData <- read.table("./household_power_consumption.txt", sep=";", 
                            header = TRUE, na.strings=c("NA", "-", "?"))
HouseholdData$timestamp <- strptime(paste(HouseholdData$Date, HouseholdData$Time), 
                                    "%d/%m/%Y %H:%M:%S")
datasubset <- subset(HouseholdData, timestamp >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & 
                             timestamp < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))

png(filename="./figure/plot1.png",
    width = 480, height = 480, bg = "transparent", type = "cairo-png")
hist(datasubset$Global_active_power, 
     col="red", xlim=c(0,7), ylim=c(0, 1200), 
     breaks = seq(0,10, by=0.5), axes = FALSE,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
axis(side = 1 , at = c(0,2,4,6))
axis(side = 2 , at = c(0, 200, 400, 600, 800, 1000, 1200))
dev.off()