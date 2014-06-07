household_power_consumption <- read.csv("~/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

str(household_power_consumption)

DF <- subset(household_power_consumption,Date == "1/2/2007" | Date =="2/2/2007")
str (DF)

DF$datetime <- strptime(paste0 (DF$Date," ", DF$Time) ,"%d/%m/%Y %H:%M:%S")


DF$Global_active_power <- as.numeric(levels(DF$Global_active_power))[DF$Global_active_power]
DF$Global_reactive_power <- as.numeric(levels(DF$Global_reactive_power))[DF$Global_reactive_power]
DF$Voltage <- as.numeric(levels(DF$Voltage))[DF$Voltage]
DF$Global_intensity <- as.numeric(levels(DF$Global_intensity))[DF$Global_intensity]
DF$Sub_metering_1 <- as.numeric(levels(DF$Sub_metering_1))[DF$Sub_metering_1]
DF$Sub_metering_2 <- as.numeric(levels(DF$Sub_metering_2))[DF$Sub_metering_2]

png("plot2.png", width = 480, height = 480)
plot(DF$datetime,DF$Global_active_power,type = "l",ylab ="Global Active Power (kilowatts)", xlab = NA)
dev.off()
