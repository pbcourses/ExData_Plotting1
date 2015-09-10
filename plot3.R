# Get the project data
source("getProjectData.R")
projectData <- getProjectData()


# Open the PNG device
png("plot3.png", width = 480, height = 480)

# Customize margins
par("mar" = c(5, 5, 4, 1))

# Plot the line graph (multiple lines)
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

# Add the legend
legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3")
       )

# Close the PNG device
dev.off()