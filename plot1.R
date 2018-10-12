#plot1

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

###Plot1
png("4EDA_Week1/plot1.png",width=480,height=480)
hist(hpc3$Global_active_power,col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
