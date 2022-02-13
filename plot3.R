## Course Project Week 1
## Plot 3

library(lubridate)

w1 <- read.table("household_power_consumption.txt", sep = ";", header = T, 
                 stringsAsFactors = F, dec=".")

## Combine day time column and convert it to POSIXct object
w1$Date <- as.Date(w1$Date, format="%d/%m/%Y")
w1$dateTime <- paste0(w1$Date, " " , w1$Time)
w1$dateTime <- as_datetime(w1$dateTime)
## Subset from Feb. 1, 2007 to Feb. 2, 2007
w1 <- w1[which(w1$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 
## Change Sub_metering_1 to class: Numeric
w1$Sub_metering_1 <- as.numeric(w1$Sub_metering_1)
## Change Sub_metering_2 to class: Numeric
w1$Sub_metering_2 <- as.numeric(w1$Sub_metering_2)
## Change Sub_metering_3 to class: Numeric
w1$Sub_metering_3 <- as.numeric(w1$Sub_metering_3)

## Plot line plot - Energy sub metering vs. weekdays
png(filename="plot3.png", width=480, height = 480 )
with(w1, plot(Sub_metering_1 ~ dateTime, type='l', col = "black", 
              xlab = "", ylab="Energy sub metering" ))
lines(w1$dateTime, w1$Sub_metering_2, type="l", col = "red")
lines(w1$dateTime, w1$Sub_metering_3, type="l", col = "blue")           
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lwd = 1, cex = 0.75)
dev.off()

