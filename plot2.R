## Creating a plot of Global Active power v/s Datetime

## Reading text file using read.table command.

powerc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## inorder to avoid reading such a bulky file, subsetting data only
## for the required 2 days 01/02/2007 and 2/2/2007

powercsub<- powerc[powerc$Date %in% c("1/2/2007","2/2/2007") ,]

## creating a list of Datetime
Datetime <- strptime(paste(powercsub$Date, powercsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## converting Global_active power from character to numeric
globalActivePower <- as.numeric(powercsub$Global_active_power)

## creating plot using png command
png("plot2.png", width=480, height=480)

## creating a plot of Datetime V/s Global Active power
plot(Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



