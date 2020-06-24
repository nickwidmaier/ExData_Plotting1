##Plot 3

##Download the File if doesn't already exist
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile = "exdata_data_household_power_consumption.zip"
if(!file.exists(destfile)){
    download.file(url, destfile = destfile, method = "curl")
}
unzip(destfile)

## Reading in the data
fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Converting Date Column into a Date type
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

##Subsetting the data for 2/1/2007 and 2/2/2007
feb1 <- subset(fulldata, Date == "2007-02-01")
feb2 <- subset(fulldata, Date == "2007-02-02")
data <- rbind(feb1, feb2)

##Adding a datetime column
data$datetime <- strptime(paste(data$Date, data$Time), "%F %H:%M:%S")

##Open the Graphics Device
png("plot3.png")

##Generating the plot
with(data, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = ""))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), cex = 0.7)

##Closing the Graphics Device
dev.off()


       
       
       