file <- "C:/Users/vidus/OneDrive/Desktop/coursera/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
reqpow <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(reqpow$Date, reqpow$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(reqpow$Global_active_power)
sM1 <- as.numeric(reqpow$Sub_metering_1)
sM2 <- as.numeric(reqpow$Sub_metering_2)
sM3 <- as.numeric(reqpow$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, sM1, type = "l", ylab = "Energy Submetering")
lines(datetime, sM2, type = "l", col = "red")
lines(datetime, sM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"))
dev.off()
