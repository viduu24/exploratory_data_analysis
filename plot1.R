file <- "C:/Users/vidus/OneDrive/Desktop/coursera/household_power_consumption.txt"
powercons <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
reqpow <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

global_active_power <- as.numeric(reqpow$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()