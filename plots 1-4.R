

# Set working directory (EDIT if needed)
setwd("C:/Users/xps/Downloads/exdata_data_household_power_consumption")

# Read the data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

# Convert Date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for Feb 1 & 2, 2007
subset_data <- subset(
  data,
  Date == "2007-02-01" | Date == "2007-02-02"
)

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(
  subset_data$Global_active_power,
  col = "red",
  main = "",
  xlab = "Global Active Power (kilowatts)"
)

# Close device
dev.off()



## =========================
## Plot 2
## =========================

# Read the data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data
subset_data <- subset(
  data,
  Date == "2007-02-01" | Date == "2007-02-02"
)

# Create datetime variable
subset_data$datetime <- as.POSIXct(
  paste(subset_data$Date, subset_data$Time)
)

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Create line plot
plot(
  subset_data$datetime,
  subset_data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

# Close device
dev.off()



## =========================
## Plot 3
## =========================

# Read the data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data
subset_data <- subset(
  data,
  Date == "2007-02-01" | Date == "2007-02-02"
)

# Create datetime
subset_data$datetime <- as.POSIXct(
  paste(subset_data$Date, subset_data$Time)
)

# Open PNG device
png("plot3.png", width = 480, height = 480)

# First line
plot(
  subset_data$datetime,
  subset_data$Sub_metering_1,
  type = "l",
  col = "black",
  ylab = "Energy sub metering",
  xlab = ""
)

# Additional lines
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")

# Legend
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1
)

# Close device
dev.off()


## =========================
## Plot 4
## =========================

# Read the data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data
subset_data <- subset(
  data,
  Date == "2007-02-01" | Date == "2007-02-02"
)

# Create datetime
subset_data$datetime <- as.POSIXct(
  paste(subset_data$Date, subset_data$Time)
)

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set 2x2 layout
par(mfrow = c(2, 2))

# Plot 1
plot(
  subset_data$datetime,
  subset_data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Plot 2
plot(
  subset_data$datetime,
  subset_data$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

# Plot 3
plot(
  subset_data$datetime,
  subset_data$Sub_metering_1,
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

# Plot 4
plot(
  subset_data$datetime,
  subset_data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global Reactive Power"
)

# Close device
dev.off()


list.files()
