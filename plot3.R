##need to call sqldf library to use SQL Select statement to read data for 1/2/2007 and 2/2/2007
 
library(sqldf)

df <- read.csv.sql("household_power_consumption.txt",
	sql = 'select * from file where Date="1/2/2007" or Date="2/2/2007"', 
	header=TRUE,sep=";", colClasses = c("character", "character", rep("numeric",7)) )

## Data Frame df is now holding data for 1st and 2nd feb 2007. Date and Time variable loaded as character 
## and other variables are loaded as numeric 


##converting Date and Time variable to Date/Time class of R

DateTime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(DateTime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, df$Sub_metering_2, type="l", col="red")
lines(DateTime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()


