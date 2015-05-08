library("data.table")

# Read in the dataset
houseConsump = fread("household.txt", colClasses = c("Date", "numeric", rep("character", 7 )), na.strings="NA")

# Set the class type correctly
houseConsump$Date <- as.Date(houseConsump$Date, format="%d/%m/%Y")
houseConsump$Global_active_power <- as.numeric(houseConsump$Global_active_power)

# Extract the data range required
extract <- houseConsump[Date >= as.Date("01/02/2007", format="%d/%m/%Y")
                        & Date <= as.Date("02/02/2007", format="%d/%m/%Y")]

# Configure, and setup the line plot for plot2 
png("plot2.png", width=480, height=480)
plot( extract$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")

# Add appropriate axes, based upon the example provided
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
