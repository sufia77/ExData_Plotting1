## Load data
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Convert Date column from character to date
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

## Create subset based on Date 2007-02-01 and 2007-02-02
histData <- subset(data1,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Collect the data without NA
histData <- histData[complete.cases(histData),] ## Will use this data for other 3 plots

## Create PNG file
png(filename='plot1.png', width=480, height=480, units='px')

## Dreaw histogram with appropriate labels
hist(histData$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.off()
