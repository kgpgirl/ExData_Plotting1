source("getData.R")
library(lubridate)

# get the data in the form of a tibble
data <- getData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# plot the histogram of Global Active Power in plot1.png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
