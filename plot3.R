# Load required library
library(lubridate)

# Read data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date and Time using base R
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%Y-%m-%d %H:%M:%S")

# Filter for Feb 1 and 2, 2007
filtered_data <- subset(data, Date >= as.Date("2007-02-01") &
                          Date <= as.Date("2007-02-02"))

# Plot 3: Time series of sub metering
png("plot3.png", width = 480, height = 480)

plot(filtered_data$datetime, filtered_data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(filtered_data$datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$datetime, filtered_data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()

cat("Plot 3 saved as plot3.png\n")



       