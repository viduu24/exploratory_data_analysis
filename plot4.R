file <- "C:/Users/vidus/OneDrive/Desktop/coursera/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
reqpow <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(reqpow$Date, reqpow$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(reqdata$Global_active_power)
global_reactive_power <- as.numeric(reqdata$Global_reactive_power)
Voltage <- as.numeric(reqdata$Voltage)
sM1 <- as.numeric(reqdata$Sub_metering_1)
sM2 <- as.numeric(reqdata$Sub_metering_2)
sM3 <- as.numeric(reqdata$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, global_active_power,xlab = "", ylab = "Global Active Power", type = "l")

plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage",type = "l")

plot(datetime, sM1, type="l", xlab = "", ylab="Energy Submetering")
lines(datetime, sM2, type="l", col="red")
lines(datetime, sM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= , lwd=1, col=c("black", "red", "blue"),bty="n")

plot(datetime, global_reactive_power, xlab = "datetime",ylab = "Global_reactive_power", type = "l")

dev.off()
