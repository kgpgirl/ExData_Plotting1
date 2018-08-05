source("getData.R")
library(lubridate)

# get the data in the form of a tibble
data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# plot the Global Active Power against the measurement time in the plot2.png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dmy_hms(paste(data$Date, data$Time, sep = " ")), 
     data$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", 
     type = "l")
dev.off()
