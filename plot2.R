## Load the data
full_data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Convert the date variable to Date class
full_data$Date <- as.Date(full_data$Date, format = "%d/%m/%Y")

## Subset the data
data1 <- subset(full_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the dates and times within subset
data1$datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")
data1$datetime <- as.POSIXct(data1$datetime)

## Create Plot 2
attach(data1)
plot(Global_active_power ~ datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")


## Save the plot into your working directory
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data1)
