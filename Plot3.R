## Recall the plot2_Data from "plot2.R" file
## Load data
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Convert Date column from character to date
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

## Create subset based on Date 2007-02-01 and 2007-02-02
histData <- subset(data1,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Collect the data without NA
histData <- histData[complete.cases(histData),]

### For plot 2

## Create new data with additional DateTime column
plot2_data <- mutate(histData, DateTime = paste(Date,Time))

## Format DateTime column
plot2_data$DateTime <- as.POSIXct(plot2_data$DateTime)
#========================================================

dev.off()

## Open PNG file for third graph
png(filename='plot3.png', width=480, height=480, units='px')

## ploting the third plot
with(plot2_data, plot(DateTime,Sub_metering_1, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))
with(plot2_data, lines(DateTime,Sub_metering_2, col = "red"))
with(plot2_data, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
