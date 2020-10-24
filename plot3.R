
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

png("plot3.png", width = 480, height = 480, units = "px")
with(data, plot(Time, Sub_metering_1, xlab = "", 
                ylab = "Energy sub metering", 
                type = "l"))
with(data, lines(Time, Sub_metering_2, col= "red"))
with(data, lines(Time, Sub_metering_3, col= "blue"))
legend("topright", legend = names(data)[7:9], lwd= c(2,2,2),
       col = c("black", "red", "blue"))
dev.off()