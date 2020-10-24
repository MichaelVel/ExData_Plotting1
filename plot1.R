
## Downloading File 

link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
rm(link)

## Loading data
name <- scan("household_power_consumption.txt", what = character(), sep = ";", 
             nlines = 1)
data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
           na.strings = "?", skip=66637, nrows = 2880, stringsAsFactors = FALSE,
           col.names = name)

## Date and time format 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y" )
data$Time <- strptime(paste(data$Date, data$Time ), 
                      format = "%Y-%m-%d %H:%M:%S")

## Generating plot
png("plot1.png", width = 480, height = 480, units = "px")
with(data, hist(Global_active_power, col = "red", 
                xlab = "Global Active Power (kilowatts)", 
                main = "Global Active Power"))
dev.off()