## read file which resides in a "data" folder
data <- read.table(file="data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)

## subset the data from the dates 2007-02-01 and 2007-02-02
subdata <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## combine and parse the date and time columns, saving into new time variable
library(lubridate)
time <- dmy_hms(paste(subdata$Date, subdata$Time))

## generate the plot as a png file
png(filename="plot2.png", width=480, height=480)
plot(time, subdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
