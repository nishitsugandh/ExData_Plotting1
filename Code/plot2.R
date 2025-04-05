library(lubridate)
# Read the dataset
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date and Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%Y-%m-%d %H:%M:%S")

# Filter for Feb 1 and Feb 2, 2007
filtered_data <- subset(data, Date >= as.Date("2007-02-01") &
                          Date <= as.Date("2007-02-02"))

# Convert Global_active_power to numeric
filtered_data$Global_active_power <- as.numeric(filtered_data$Global_active_power)

# Plot 2: Line plot
png("plot2.png", width = 480, height = 480)

plot(filtered_data$datetime, filtered_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

cat("Plot 2 saved as plot2.png\n")


