data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                 na.strings = "?", nrows = 2075259, check.names = F, 
                 stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subsetting the data
data_subset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
convertdatetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$convertdatetime <- as.POSIXct(convertdatetime)

## Save the Plot as PNG
png(filename="plot3.png")
with(data_subset, {
  plot(Sub_metering_1 ~ convertdatetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ convertdatetime, col = 'Red')
  lines(Sub_metering_3 ~ convertdatetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()