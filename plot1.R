plot1 <- function() {
	
	## 'datafile' is the file containing the household power consuption dataset (2,075,259 observations, 9 variables)
	
	## This program reads in the power consumption data,
	## limits observations to Feb 1 and 2 2007,
	## plots the global active power variable as a histogram,
  ## and saves the plot as a PNG file.

  ## read in the data
  usedat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

  ## select the relevant observations
  subdat <- subset(usedat, usedat$Date == "1/2/2007" | usedat$Date == "2/2/2007")

  ## open PNG graphics device
  png("plot1.png", width=480, height=480)
  
  ## create histogram
  hist(subdat$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red", xlim=c(0,6), axes=FALSE)
  axis(2, seq(0, 1200, by=200)) 
  axis(1, seq(0, 6, by=2))
  
  ## close graphics device
  dev.off()
    
}