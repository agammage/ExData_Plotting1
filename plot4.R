setwd("/Users/agammage/Documents/R/Coursera/Exploratory Data Analysis/")

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] 

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col="Red")
  lines(Sub_metering_3~Datetime,col="Blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Submetering1", "Submetering2", "Submetering3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Reactive Power (kilowatts)",xlab="")
})