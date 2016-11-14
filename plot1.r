imported_file <- "household_power_consumption.txt"

imported_data <- read.table(imported_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
needed_data <- imported_data[imported_data$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(needed_data$Global_active_power)

png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")

dev.off()