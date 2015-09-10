# Get the project data
source("getProjectData.R")
projectData <- getProjectData()


# Open the PNG device
png("plot2.png", width = 480, height = 480)

# Customize margins
par("mar" = c(5, 5, 4, 1))

# Plot the line graph
plot(projectData$datetime, projectData$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# Close the PNG device
dev.off()