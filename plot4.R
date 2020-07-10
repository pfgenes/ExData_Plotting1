# Load Data Set
power_cons <-  read.table("household_power_consumption.txt", stringsAsFactors = FALSE,header = TRUE, sep = ";")

# Change Date column from character to date variable
power_cons$Date <- as.Date(power_cons$Date, format = "%d/%m/%Y")

# Subset dataset
subset <- subset(power_cons, Date == "2007-02-01" | Date == "2007-02-02")

#Change date column to appropriate format
subset$Date <- as.POSIXct(paste(subset$Date, subset$Time))

#change variables from character to numeric variable
subset$Global_active_power <- as.numeric(subset$Global_active_power)
subset$Voltage <- as.numeric(subset$Voltage)
subset$Global_reactive_power <- as.numeric(subset$Global_reactive_power)

dev.new()

# Open Graphics device
png("plot4.png", width=480, height=480)

# Create 2 rows and 2 columns for graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma = c(0,0,2,0))

# Plot 4 plots
with(subset, plot(Date, Global_active_power,type = "l", xlab = "",ylab = "Global Active Power"))

with(subset, plot(Date, Voltage,type = "l", xlab = "datetime",ylab = "Voltage"))

with(subset, plot(Date, Sub_metering_1,type = "l", xlab = "",ylab = "Energy sub metering"))
lines(subset$Date, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$Date, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd=2,bty = "n",col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(subset, plot(Date, Global_reactive_power,type = "l", xlab = "datetime"))

dev.off()