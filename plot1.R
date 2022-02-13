## Course Project Week 1
## Plot 1
w1 <- read.table("household_power_consumption.txt", header= TRUE, 
                sep=";", stringsAsFactors=FALSE, dec=".")
## Subset from Feb. 1, 2007 to Feb. 2, 2007
w1 <- w1[w1$Date %in% c("1/2/2007","2/2/2007"),]
## Change Date to class: Date
w1$Date <- as.Date(w1$Date, format="%d/%m/%Y")
## Change Global_active_power to class: Numeric
w1$Global_active_power <- as.numeric(w1$Global_active_power)

## Plot histogram - frequencies of Global Active Power 
png(filename="plot1.png", width = 480, height = 480 )
hist(w1$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
