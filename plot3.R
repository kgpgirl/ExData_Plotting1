source("getData.R")
library(lubridate)

# get the data in the form of a tibble
data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
# add the Date & Time as POSIXct
data$datetime <- dmy_hms(paste(data$Date, data$Time, sep = " "))

# plot the 3 Sub Meter measurements against the measurement time in the plot3.png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(data$datetime, data$Sub_metering_1, col="black", type = "l", 
     xlab = "", ylab = "Energy Sub metering",
     xlim = c(min(data$datetime), max(data$datetime)),
     ylim = c(0, max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)))
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = c(1,1,1))

dev.off()