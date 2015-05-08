library("data.table")

# Read in the dataset
houseConsump = fread("household.txt", colClasses = c("Date", "numeric", rep("character", 7 )), na.strings="NA")

# Set the class type correctly
houseConsump$Date <- as.Date(houseConsump$Date, format="%d/%m/%Y")
houseConsump$Global_active_power <- as.numeric(houseConsump$Global_active_power)
houseConsump$Global_reactive_power <- as.numeric(houseConsump$Global_reactive_power)
houseConsump$Voltage <- as.numeric(houseConsump$Voltage)
houseConsump$Sub_metering_1 <- as.numeric(houseConsump$Sub_metering_1)
houseConsump$Sub_metering_2 <- as.numeric(houseConsump$Sub_metering_2)
houseConsump$Sub_metering_3 <- as.numeric(houseConsump$Sub_metering_3)

# Extract the data range required
extract <- houseConsump[Date >= as.Date("01/02/2007", format="%d/%m/%Y")
                        & Date <= as.Date("02/02/2007", format="%d/%m/%Y")]

# Configure, and setup the line plot for plot2 
png("plot4.png", width=480, height=480)

# Setup graph plot arrangement
par(mfrow=c(2,2))

# PLOT 1
# Add the Global Active Power plot
plot( extract$Global_active_power, type="l", xlab="", ylab="Global Active Power", xaxt="n")

# Add appropriate axes, based upon the example provided
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

# PLOT 2
# Add the Voltage over datetime
plot( extract$Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt="n")

# Add appropriate axes, based upon the example provided
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

# PLOT 3
# Add the Energy sub metering plot
plot( extract$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines( extract$Sub_metering_2, col="red")
lines( extract$Sub_metering_3, col="blue")

# Add the appropriate legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"), bty="n")

# Add appropriate axes, based upon the example provided
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

# PLOT 4
# Add Global_reactive_power over datetime
plot( extract$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")

# Add appropriate axes, based upon the example provided
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

dev.off()