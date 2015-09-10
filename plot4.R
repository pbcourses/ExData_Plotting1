# Get the project data
source("getProjectData.R")
projectData <- getProjectData()


# Open the PNG device
png("plot4.png", width = 480, height = 480)

# Customize margins
par("mar" = c(5, 5, 4, 1))

# Set a 2x2 plots grid by rows
par("mfrow" = c(2, 2))

# Plot 1, 1
plot(projectData$datetime, projectData$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l")

# Plot 1, 2
with(projectData,
     plot(datetime, Voltage,
          type = "l")
     )

# Plot 2, 1
plot(projectData$datetime, projectData$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     col = "black",
     type = "l")
lines(projectData$datetime, projectData$Sub_metering_2,
      col = "red",
      type = "l")
lines(projectData$datetime, projectData$Sub_metering_3,
      col = "blue",
      type = "l")

legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       box.lwd = 0
)

# Plot 2, 2
with(projectData,
     plot(datetime, Global_reactive_power,
          type = "l")
     )

# Close the PNG device
dev.off()