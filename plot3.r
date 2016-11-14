import_file <- "household_power_consumption.txt"

import_data <- read.table(import_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
needed_data <- import_data[import_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(needed_data$Date, needed_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(needed_data$Global_active_power)

sm1 <- as.numeric(needed_data$Sub_metering_1)
sm2 <- as.numeric(needed_data$Sub_metering_2)
sm3 <- as.numeric(needed_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", ylab="Energy sub metering", xlab="")

lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()