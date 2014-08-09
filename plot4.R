plot4 <- function() {
	
	## 'datafile' is the file containing the household power consuption dataset (2,075,259 observations, 9 variables)
	
	## This program reads in the power consumption data,
	## limits observations to Feb 1 and 2 2007,
	## plots a 2x2 matrix of four line graphs,
  ## and saves the plot as a PNG file.

  ## read in the data
  usedat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

  ## select the relevant observations
  subdat <- subset(usedat, usedat$Date == "1/2/2007" | usedat$Date == "2/2/2007")

  ## convert character Date, Time to date/time formats
  subdat$datim <- paste(subdat$Date, subdat$Time)
  subdat$datim2 <- strptime(subdat$datim, "%d/%m/%Y %H:%M:%S")
    
  ## open PNG graphics device
  png("plot4.png", width=480, height=480)
  
  ## adjust settings for 2 x 2 plots on page, important to do this after opening graphics device!
  par(mfrow=c(2,2))
  
  ## create line graph #1
  plot(subdat$datim2, subdat$Global_active_power, xlab=" ", ylab="Global Active Power", type="l", col="black")

  ## create line graph #2
  plot(subdat$datim2, subdat$Voltage, xlab="datetime", ylab="Voltage", type="l", col="black")
  
  ## create line graph #3
  plot(subdat$datim2, subdat$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="l", col="black")
  lines(subdat$datim2, subdat$Sub_metering_2, col="red")
  lines(subdat$datim2, subdat$Sub_metering_3, col="blue")
  
  ## create line graph #4
  plot(subdat$datim2, subdat$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l", col="black")
  
  ## close graphics device
  dev.off()
    
}