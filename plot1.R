## read file which resides in a "data" folder
data <- read.table(file="data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)

## subset the data from the dates 2007-02-01 and 2007-02-02
subdata <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## generate the plot as a png file
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(subdata$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
