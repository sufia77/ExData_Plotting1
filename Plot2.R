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
## Open PNG file for second graph
png(filename='plot2.png', width=480, height=480, units='px')

plot(plot2_data$DateTime, plot2_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
