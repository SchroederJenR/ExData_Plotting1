plot3 <- function() {
	
	## 'datafile' is the file containing the household power consuption dataset (2,075,259 observations, 9 variables)
	
	## This program reads in the power consumption data,
	## limits observations to Feb 1 and 2 2007,
	## plots energy sub metering as 3 overlaid line graphs,
  ## and saves the plot as a PNG file.

  ## read in the data
  usedat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

  ## select the relevant observations
  subdat <- subset(usedat, usedat$Date == "1/2/2007" | usedat$Date == "2/2/2007")

  ## convert character Date, Time to date/time formats
  subdat$datim <- paste(subdat$Date, subdat$Time)
  subdat$datim2 <- strptime(subdat$datim, "%d/%m/%Y %H:%M:%S")
  
  ## open PNG graphics device
  png("plot3.png", width=480, height=480)
  
  ## create line graph
  plot(subdat$datim2, subdat$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="l", col="black")
  lines(subdat$datim2, subdat$Sub_metering_2, col="red")
  lines(subdat$datim2, subdat$Sub_metering_3, col="blue")
  
  ## close graphics device
  dev.off()
    
}