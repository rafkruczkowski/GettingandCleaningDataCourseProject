# Libraries
library(reshape2)

#1. Download dataset
rawDataDir <- "./rawData"
rawDataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawDataFilename <- "rawData.zip"
rawDataDFn <- paste(rawDataDir, "/", "rawData.zip", sep = "")
dataDir <- "./data"

if (!file.exists(rawDataDir)) {
    dir.create(rawDataDir)
    download.file(url = rawDataUrl, destfile = rawDataDFn)
}
if (!file.exists(dataDir)) {
    dir.create(dataDir)
    unzip(zipfile = rawDataDFn, exdir = dataDir)
}
# Import the individual train datasets
x_train <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/train/Y_train.txt"))
s_train <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/train/subject_train.txt"))

# Import the individual test datasets
x_test <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/test/Y_test.txt"))
s_test <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/test/subject_test.txt"))

# Merge the two datasets into a new dataset
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)

# Load the /features/ dataset
feature <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/features.txt"))

# Load and convert to strings the lables data
a_label <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/activity_labels.txt"))
a_label[,2] <- as.character(a_label[,2])

# From the datasets, extract using grep the mean and standard deviations
selectedCols <- grep("-(mean|std).*", as.character(feature[,2]))
selectedColNames <- feature[selectedCols, 2]
selectedColNames <- gsub("-mean", "Mean", selectedColNames)
selectedColNames <- gsub("-std", "Std", selectedColNames)
selectedColNames <- gsub("[-()]", "", selectedColNames)

# Bind all the data to one set and apply the col names
x_data <- x_data[selectedCols]
allData <- cbind(s_data, y_data, x_data)
colnames(allData) <- c("Subject", "Activity", selectedColNames)
# Apply factors to the subjects from the lables
allData$Activity <- factor(allData$Activity, levels = a_label[,1], labels = a_label[,2])
allData$Subject <- as.factor(allData$Subject)

# Use the completed dataset and melt it to a tidy set by Subject and Activity
meltedData <- melt(allData, id = c("Subject", "Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)
# Write results to file
write.table(tidyData, "./tidy_results.txt", row.names = FALSE, quote = FALSE)