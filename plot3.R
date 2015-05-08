library("data.table")

# Read in the dataset
houseConsump = fread("household.txt", colClasses = c("Date", "numeric", rep("character", 7 )), na.strings="NA")

# Set the class type correctly
houseConsump$Date <- as.Date(houseConsump$Date, format="%d/%m/%Y")
houseConsump$Sub_metering_1 <- as.numeric(houseConsump$Sub_metering_1)
houseConsump$Sub_metering_2 <- as.numeric(houseConsump$Sub_metering_2)
houseConsump$Sub_metering_3 <- as.numeric(houseConsump$Sub_metering_3)

# Extract the data range required
extract <- houseConsump[Date >= as.Date("01/02/2007", format="%d/%m/%Y")
                        & Date <= as.Date("02/02/2007", format="%d/%m/%Y")]

# Configure, and setup the line plot for plot2 
png("plot3.png", width=480, height=480)

# Add all data series to the graph
plot( extract$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines( extract$Sub_metering_2, col="red")
lines( extract$Sub_metering_3, col="blue")

# Add the appropriate legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"))

# Add appropriate axes, based upon the example provided
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()