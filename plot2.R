## Course Project Week 1
## Plot 2

library(lubridate)

w1 <- read.table("household_power_consumption.txt", sep = ";", header = T, 
                 stringsAsFactors = F, dec=".")

## Combine day time column and convert it to POSIXct object
w1$Date <- as.Date(w1$Date, format="%d/%m/%Y")
w1$dateTime <- paste0(w1$Date, " " , w1$Time)
w1$dateTime <- as_datetime(w1$dateTime)
## Subset from Feb. 1, 2007 to Feb. 2, 2007
w1 <- w1[which(w1$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 
## Change Global_active_power to class: Numeric
w1 $Global_active_power <- as.numeric(w1$Global_active_power)

## Plot line plot - Global Active Power vs. weekdays
png(filename="plot2.png", width=480, height = 480 )
with(w1, plot(Global_active_power ~ dateTime, type='l', 
              xlab = "", ylab="Global Active Power (kilowatts)" ))
dev.off()