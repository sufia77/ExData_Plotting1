## Call plot2_data from "plot2.R" file
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
## Open PNG file for fourth graph
png(filename='plot4.png', width=480, height=480, units='px')

## Set the parameter for visualization of graphics
##oma = A vector of the form c(bottom, left, top, right) giving the size of the outer margins in lines of text.
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Ploting all four plots
with(plot2_data, {
  plot(DateTime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(DateTime,Voltage, type="l", ylab="Voltage (volt)", xlab="")
  plot(DateTime, Sub_metering_1,type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(DateTime,Sub_metering_2,col='Red')
  lines(DateTime,Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime,Global_reactive_power, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})