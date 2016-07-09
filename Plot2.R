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
png(filename="plot2.png")
plot(data_subset$Global_active_power ~ data_subset$convertdatetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()