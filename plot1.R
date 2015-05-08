library("data.table")

# Read in the dataset
houseConsump = fread("household.txt", colClasses = c("Date", "numeric", rep("character", 7 )), na.strings="NA")

# Set the class type correctly
houseConsump$Date <- as.Date(houseConsump$Date, format="%d/%m/%Y")
houseConsump$Global_active_power <- as.numeric(houseConsump$Global_active_power)

# Extract the data range required
extract <- houseConsump[Date >= as.Date("01/02/2007", format="%d/%m/%Y")
  & Date <= as.Date("02/02/2007", format="%d/%m/%Y")]

# Configure, and produce the histogram, writing to plot1.png
png("plot1.png", width=480, height=480)
hist(extract$Global_active_power, col="Red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency" )
dev.off()