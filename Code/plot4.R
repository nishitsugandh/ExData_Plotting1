library(lubridate)
# Read the dataset
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Parse Date and Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%Y-%m-%d %H:%M:%S")

# Filter for Feb 1 and Feb 2, 2007
filtered_data <- subset(data, Date >= as.Date("2007-02-01") &
                          Date <= as.Date("2007-02-02"))

# Plot 4: 2x2 layout of time series plots
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))  # 2 rows, 2 columns

# Top-left: Global Active Power
plot(filtered_data$datetime, filtered_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top-right: Voltage
plot(filtered_data$datetime, filtered_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom-left: Sub metering
plot(filtered_data$datetime, filtered_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")

lines(filtered_data$datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$datetime, filtered_data$Sub_metering_3, col = "blue")

legend("topright",
       bty = "n",  # no box
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

# Bottom-right: Global Reactive Power
plot(filtered_data$datetime, filtered_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

dev.off()

cat("Plot 4 saved as plot4.png\n")

