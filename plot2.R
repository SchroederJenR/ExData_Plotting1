plot2 <- function() {
	
	## 'datafile' is the file containing the household power consuption dataset (2,075,259 observations, 9 variables)
	
	## This program reads in the power consumption data,
	## limits observations to Feb 1 and 2 2007,
	## plots the global active power as a line graph,
  ## and saves the plot as a PNG file.

  ## read in the data
  usedat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

  ## select the relevant observations
  subdat <- subset(usedat, usedat$Date == "1/2/2007" | usedat$Date == "2/2/2007")

  ## convert character Date, Time to date/time formats
  subdat$datim <- paste(subdat$Date, subdat$Time)
  subdat$datim2 <- strptime(subdat$datim, "%d/%m/%Y %H:%M:%S")
  
  ## open PNG graphics device
  png("plot2.png", width=480, height=480)
  
  ## create line graph
  plot(subdat$datim2, subdat$Global_active_power, xlab=" ", ylab="Global Active Power (kilowatts)", type="l")
  
  ## close graphics device
  dev.off()
    
}