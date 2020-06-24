##Plot 2

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
png("plot2.png")

##Generating the Plot
with(data, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(data, lines(datetime, Global_active_power))

##Closing the Graphics Device
dev.off()

