# Load Data Set
power_cons <-  read.table("household_power_consumption.txt", stringsAsFactors = FALSE,header = TRUE, sep = ";")

# Change Date column from character to date variable
power_cons$Date <- as.Date(power_cons$Date, format = "%d/%m/%Y")

# Subset dataset
subset <- subset(power_cons, Date == "2007-02-01" | Date == "2007-02-02")

#Change date column to appropriate format
subset$Date <- as.POSIXct(paste(subset$Date, subset$Time))

#change Global active power variable from character to numeric variable
subset$Global_active_power <- as.numeric(subset$Global_active_power)

# Open Graphics device
png("plot2.png", width=480, height=480)

# Create plot
with(subset, plot(Date, Global_active_power,type = "l", xlab = "",ylab = "Global Active Power (kilowatts)"))

# Write plot to png file

dev.off()


