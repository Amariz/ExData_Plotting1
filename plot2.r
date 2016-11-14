import_file <- "household_power_consumption.txt"

import_data <- read.table(import_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
needed_data <- import_data[import_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(needed_data$Date, needed_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(needed_data$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (Kilowatts)")

dev.off()