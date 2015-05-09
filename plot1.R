##need to call sqldf library to use SQL Select statement to read data for 1/2/2007 and 2/2/2007
 
library(sqldf)

df <- read.csv.sql("household_power_consumption.txt",
	sql = 'select * from file where Date="1/2/2007" or Date="2/2/2007"', 
	header=TRUE,sep=";", colClasses = c("character", "character", rep("numeric",7)) )

## Data Frame df is now holding data for 1st and 2nd feb 2007. Date and Time variable loaded as character 
## and other variables are loaded as numeric 

png("plot1.png", width=480, height=480)
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

