
library(lubridate)

# Read the dataset
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date and Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter for Feb 1 and Feb 2, 2007
filtered_data <- subset(data, Date >= as.Date("2007-02-01") &
                          Date <= as.Date("2007-02-02"))

# Ensure Global_active_power is numeric
filtered_data$Global_active_power <- as.numeric(filtered_data$Global_active_power)

# Plot 1: Histogram
png("plot1.png", width = 480, height = 480)

hist(filtered_data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()

cat("Plot 1 saved as plot1.png\n")


