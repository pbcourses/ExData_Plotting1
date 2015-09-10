# Loads the raw data and returns the project data ready to
# use for analysis

# Since the file is not supposed to change in the future
# only the needed and fixed number of rows are imported.
# In this case it is more time and memory efficient as
# suggested by the original project assignment.

getProjectData <- function() {
    
    fileName <- "household_power_consumption.txt"
    columnClasses <- c("character", "character", rep("numeric", 7))
    
    # get the coulmn names from the first row of the dataset file
    columnNames <- read.csv(fileName, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
    
    # Number of rows to be skipped an readed
    rowsToSkip <- 66637
    rowsToRead <- 2880
    
    # read the raw data
    data = read.table(fileName, colClasses = columnClasses, sep = ";", quote = "", na.strings = "?", skip = rowsToSkip, nrows = rowsToRead, header = FALSE)
    
    # set the column names
    colnames(data) <- unlist(columnNames)
    
    # Convert Data and Time to a POSIXlt date and time and add it to the data.
    # `sprintf` should be faster than `paste`
    data$datetime <- strptime(sprintf("%s %s", data$Date, data$Time),
                              format = "%d/%m/%Y %H:%M:%S")
    return(data)
}