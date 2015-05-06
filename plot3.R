## Creating a plot of Sub metering v/s Datetime

## Reading text file using read.table command.

powerc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

## inorder to avoid reading such a bulky file, subsetting data only
## for the required 2 days 01/02/2007 and 2/2/2007

powercsub<- powerc[powerc$Date %in% c("1/2/2007","2/2/2007") ,]

## creating a list of Datetime

Datetime <- strptime(paste(powercsub$Date, powercsub$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## converting Sub_metering_(1/2/3) from character to numeric
submetering1 <- as.numeric(powercsub$Sub_metering_1)
submetering2 <- as.numeric(powercsub$Sub_metering_2)
submetering3 <- as.numeric(powercsub$Sub_metering_3)


## creating plot using png command
png("plot3.png", width=480, height=480)

## creating a plot of Datetime V/s Sub_metering_1/2/3

plot(Datetime,submetering1, type="l", xlab="", ylab="Energy Sub metering")
lines(Datetime, submetering2, type="l", col="red")
lines(Datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
