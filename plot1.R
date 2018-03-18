setwd("/Users/agammage/Documents/R/Coursera/Exploratory Data Analysis/")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';')

subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] 

hist(as.numeric(subdata$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

