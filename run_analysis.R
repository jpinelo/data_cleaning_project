# Summary of sun_analysis script actions: 
# 0 - Load libraries, download data
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names.
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# ACTION 0 - Load libraries, download data
# LOAD PACKAGES
library(data.table)

# Data download and import
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "dataset.zip", method = "curl")


# ACTION 1 - Merges the training and the test sets to create one data set
# load features file
features <- read.table(file = "features.txt",
                       header = FALSE,
                       col.names = c("featurecode", "featurelabel"),
                       colClasses = "factor",
                       sep = " ")
posFeaturesMeanStd <- grep(".[Mm]ean|.[Ss]td", features$featurelabel)
posFeaturesMeanStd <- as.list(posFeaturesMeanStd)

# Load test files
subject_test <- read.table(file = "subject_test.txt",
                           header = FALSE,
                           col.names = ("subject"),
                           colClasses = "factor",
                           sep = "\t")

x_test <- read.fwf(file = "x_test.txt", widths = rep(16, 561))
colnames(x_test) <- features$featurelabel

y_test <- read.table(file = "y_test.txt",
                     header = FALSE,
                     col.names = ("activitycode"),
                     colClasses = "factor",
                     sep = "\t")

# bind test files into test dataset 
testSet <- cbind(x_test, subject_test, y_test)

# Load train files
subject_train <- read.table(file = "subject_train.txt",
                            header = FALSE,
                            col.names = ("subject"),
                            colClasses = "factor",
                            sep = "\t")

x_train <- read.fwf(file = "x_train.txt", widths = rep(16, 561))
colnames(x_train) <- features$featurelabel

y_train <- read.table(file = "y_train.txt",
                      header = FALSE,
                      col.names = ("activitycode"),
                      colClasses = "factor",
                      sep = "\t")

# bind train files into test dataset 
trainSet <- cbind(x_train, subject_train, y_train)

# bind test and train datasets together creating testTrainSet dataset
testTrainSet <- rbind(testSet, trainSet)


# ACTION 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
`%notin%` <- function(x,y) !(x %in% y)
allCols <- c(1:ncol(testTrainSet))
colsToKeep <- append(posFeaturesMeanStd, c("562", "563"))

colsToDelete <- allCols[allCols %notin% colsToKeep]

testTrainSet <- as.data.table(testTrainSet)

testTrainSetmeanStd <- testTrainSet[ , (colsToDelete) := NULL]


# ACTION 3 - Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(file = "activity_labels.txt",
                              header = FALSE,
                              col.names = c("activitycode", "activitylabel"),
                              colClasses = "factor",
                              sep = " ")

testTrainSetmeanStdActivityLabels <- merge(testTrainSetmeanStd, activity_labels, by = "activitycode")

# ACTION 4 - Appropriately labels the data set with descriptive variable names.
# achieved within ACTION 1 - dataset to follow up in action 5: testTrainSetmeanStdActivityLabels

# ACTION 5 START - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidySet <- testTrainSetmeanStdActivityLabels[, lapply(.SD, mean), by = c("activitylabel", "subject")]

# Export end file
write.table(tidySet, file = "tidySet.txt", row.name = FALSE)
