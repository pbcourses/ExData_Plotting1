

# Get the project data
source("getProjectData.R")
projectData <- getProjectData()


# Open the PNG device
png("plot1.png", width = 480, height = 480)

# Customize margins
par("mar" = c(5, 5, 4, 1))

# Plot the histogram
hist(projectData$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close the PNG device
dev.off()
