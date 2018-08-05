library(readr)

# Function to download the compressed file and uncompress/extract the datafile
# Checks if already downloaded/uncompressed/extracted
# Returns the data in the local file as a tibble
getData <- function(origFile) {
    filename <- "household_power_consumption.txt"
    # download the data and unzip if not done already
    if(!file.exists(filename)) {
        message(sprintf("Downloading file: %s", origFile))
        download.file(origFile, "orig.zip", mode = "wb")
        unzip("orig.zip", filename, exdir=getwd())
        unlink("orig.zip")
    }
    
    message(sprintf("Reading data from: %s", filename))
    
    # define the Column Names
    cnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    # read the data for 02/01/2007 and 02/02/2007
    read_delim(filename, delim=";", na=c("?"), skip=66637, n_max = 2880, col_names = cnames)
}
