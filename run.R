######################################################################################
# Libraries
library(reshape2)

######################################################################################
# Functions
downloadData <- function() {
    rawDataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    rawDataDFn <- paste(rawDataDir, "/", "rawData.zip", sep = "")
    if (!file.exists(rawDataDir)) {
        dir.create(rawDataDir)
        download.file(url = rawDataUrl, destfile = rawDataDFn)
    }
    if (!file.exists(dataDir)) {
        dir.create(dataDir)
        unzip(zipfile = rawDataDFn, exdir = dataDir)
    }
}

importDataSet <- function(file2import) {
    localSet <- read.table(paste(sep = "", dataDir, file2import))
    return(localSet)
}

mergeDataSets <- function(train, test) {
    localdata <- rbind(train, test)
    return(localdata)
}

selectColFunc <- function(selectedCols) {
    #selectedCols <- grep("-(mean|std).*", as.character(feature[,2]))
    selectedColNames <- feature[selectedCols, 2]
    selectedColNames <- gsub("-mean", "Mean", selectedColNames)
    selectedColNames <- gsub("-std", "Std", selectedColNames)
    selectedColNames <- gsub("[-()]", "", selectedColNames)
    return(selectedColNames)
}

bindandapplynames <- function() {
    x_data <- x_data[selectedCols]
    allData <- cbind(s_data, y_data, x_data)
    colnames(allData) <- c("Subject", "Activity", selectedColNames)
    # Apply factors to the subjects from the lables
    allData$Activity <- factor(allData$Activity, levels = a_label[,1], labels = a_label[,2])
    allData$Subject <- as.factor(allData$Subject)
    return(allData)
}

meltDataFunc <- function() {
    meltedData <- melt(allData, id = c("Subject", "Activity"))
    tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)
    write.table(tidyData, "./tidy_results.txt", row.names = FALSE, quote = FALSE)
}

######################################################################################
# Logic
# Enviromental variables
rawDataDir <- "./rawData"
rawDataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDir <- "./data"

# Download data and unzip it
downloadData()

# Import the individual train datasets
x_train <- importDataSet("/UCI HAR Dataset/train/X_train.txt")
y_train <- importDataSet("/UCI HAR Dataset/train/Y_train.txt")
s_train <- importDataSet("/UCI HAR Dataset/train/subject_train.txt")
# Import the individual test datasets
x_test <- importDataSet("/UCI HAR Dataset/test/X_test.txt")
y_test <- importDataSet("/UCI HAR Dataset/test/Y_test.txt")
s_test <- importDataSet("/UCI HAR Dataset/test/subject_test.txt")
feature <- importDataSet("/UCI HAR Dataset/features.txt")
a_label <- importDataSet("/UCI HAR Dataset/activity_labels.txt")
a_label[,2] <- as.character(a_label[,2])

# Merge data to new dataset to be used later
x_data <- mergeDataSets(x_train, x_test)
y_data <- mergeDataSets(y_train, y_test)
s_data <- mergeDataSets(s_train, s_test)
# From the datasets, extract using grep the mean and standard deviations
selectedCols <- grep("-(mean|std).*", as.character(feature[,2]))
selectedColNames <- selectColFunc(selectedCols)
# Load and convert to strings the lables data
allData <- bindandapplynames()
# Use the completed dataset and melt it to a tidy set by Subject and Activity
meltDataFunc()
