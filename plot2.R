setwd("/Users/agammage/Documents/R/Coursera/Exploratory Data Analysis/")

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] 

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

plot(subdata$Global_active_power~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
