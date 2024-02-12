file <- "C:/Users/vidus/OneDrive/Desktop/coursera/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
reqpow <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(reqpow$Date, reqpw$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(reqpow$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()

