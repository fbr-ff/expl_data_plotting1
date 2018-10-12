
setwd("~/current_work/R")
#setwd("4EDA_Week1")
#loading package
require(tidyverse)
#loading data
hpc2 <- read_delim("4EDA_Week1/household_power_consumption.txt", 
                   ";", escape_double = FALSE, trim_ws = TRUE,na="?")
#adding date/time
hpc2$DateTime<-strptime(paste(hpc2$Date,hpc2$Time),"%d/%m/%Y %H:%M:%S")
#Subsetting
hpc3 <- hpc2[hpc2$Date %in% c("1/2/2007","2/2/2007") ,]

### Plot4

png("4EDA_Week1/plot4.png",width=480,height=480)
par(mfrow = c(2,2)) 

#plot1

plot(hpc3$DateTime,hpc3$Global_active_power,type = "l",
     xlab = "",
     ylab= "Global Active Power")

#plot2

plot(hpc3$DateTime,hpc3$Voltage,type = "l",
     xlab = "datetime",
     ylab= "Voltage")

#plot3
plot(hpc3$DateTime, hpc3$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")
lines(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plot #4
plot(hpc3$DateTime,hpc3$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
par(mfrow = c(1,1))
