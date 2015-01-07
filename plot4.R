## read file which resides in a "data" folder
data <- read.table(file="data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)

## subset the data from the dates 2007-02-01 and 2007-02-02
subdata <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## combine and parse the date and time columns, saving into new time variable
library(lubridate)
time <- dmy_hms(paste(subdata$Date, subdata$Time))

## generate the 4 plots in a png file
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

## top-left plot
plot(time, subdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

## top-right plot
plot(time, subdata$Voltage, type="l", ylab="Voltage", xlab="datetime")

## bottom-left plot
plot(time, subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(time, subdata$Sub_metering_2, type="l", col="red")
lines(time, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")

## bottom-right plot
plot(time, subdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
