## R Script on Global Active Power, Voltage(v/s Datetime),Energy
## Sub metering(v/s Datetime),Global Reactive Power (v/sDatetime)

## reading text file by read.table command
powerc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## to avoid such a big file subsetting only data required pertaining
## to two days of 1/2/2007 and 2/2/2007

powercsub<-powerc[powerc$Date %in% c("1/2/2007","2/2/2007"),]

## creating a list of datetime in the required format using paste fun
Datetime<-strptime(paste(powercsub$Date,powercsub$Time,sep=""),"%d/%m/%Y %H:%M:%S")

## converting Global_active_power from character to numeric

globalActivePower<-as.numeric(powercsub$Global_active_power)

## Converting Voltage from character to numeric
voltage<-as.numeric(powercsub$Voltage)

## converting Global_reactive power from character to numeric
globalReactivePower<-as.numeric(powercsub$Global_reactive_power)


## converting Sub_metering_(1/2/3) column from character to numeric
submetering1<-as.numeric(powercsub$Sub_metering_1)
submetering2<-as.numeric(powercsub$Sub_metering_2)
submetering3<-as.numeric(powercsub$Sub_metering_3)

## creating plot.4 in png format

png("plot4.png",width=480,height=480)

## creating png plot in 2 rows and 2 columns format

par(mfrow=c(2,2))

## plotting Global Active Power v/s Datetime
plot(Datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power")


## plotting voltage v/s Datetime
plot(Datetime,voltage,type="l",xlab="Datetime",ylab="Voltage")

## plotting submetering v/s Datetime
plot(Datetime,submetering1,type="l",ylab="Energy Sub Metering",xlab="")
lines(Datetime,submetering2,type="l",col="red")
lines(Datetime,submetering3,type="l",col="blue")

## inserting legend in the plot
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

## plotting Global Reactive Power v/s Datetime
plot(Datetime,globalReactivePower,type="l",xlab="Datetime",ylab="Global Reactive Power")
dev.off()