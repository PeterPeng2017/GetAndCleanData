library(dplyr)
library(tidyr)

workingDir <- "/Users/peter/DataScience/GetAndCleanData/courseAssignment/GetAndCleanData"

setwd(workingDir)

features <- read.table("UCI_HAR_Dataset/features.txt", stringsAsFactors = FALSE)

readMeasurementFromFile <- function(dataFilePath, subjectFilePath, activityFilePath) {
    measurementData <- read.table(dataFilePath, header = FALSE)
    activityData <- read.table(activityFilePath, header = FALSE)
    colnames(activityData) <- c("activityId")
    
    subject <- read.table(subjectFilePath, header = FALSE)
    colnames(subject) <- c("subjectId")
    
    colnames(measurementData) <- features[, 2]
    measurementData <- measurementData[, !duplicated(colnames(measurementData))]
    
    
    stdCols <- grep("std\\(\\)", colnames(measurementData))
    meanCols <- grep("mean\\(\\)", colnames(measurementData))
    targetCols <- c(stdCols, meanCols)
    
    measurementData <- measurementData %>% select(targetCols)
    
    measurementData <- bind_cols(activityData, measurementData)
    measurementData <- bind_cols(subject, measurementData)
    
    return(measurementData)
}

trainData <- readMeasurementFromFile("UCI_HAR_Dataset/train/X_train.txt", 
                                     "UCI_HAR_Dataset/train/subject_train.txt",
                                     "UCI_HAR_Dataset/train/y_train.txt")

testData <- readMeasurementFromFile("UCI_HAR_Dataset/test/X_test.txt", 
                                    "UCI_HAR_Dataset/test/subject_test.txt",
                                    "UCI_HAR_Dataset/test/y_test.txt")

allData <- bind_rows(trainData, testData)

activityLabels <- read.table("UCI_HAR_Dataset/activity_labels.txt", header = FALSE,stringsAsFactors = FALSE)
colnames(activityLabels) <- c("activityId", "activityName")

allData <- allData %>% left_join(activityLabels, c("activityId" = "activityId"))

allData <- allData %>% select(1, 2, ncol(allData), c(3: ncol(allData) - 1))

tidyData <- allData %>% gather(measurement, value, -c(subjectId, activityId, activityName))

tidyData <- tidyData %>% group_by(subjectId, activityName, measurement) %>% summarise(avg = mean(value))

tidyData <- tidyData %>% spread(measurement, avg)

write.table(tidyData,"avgData.txt", row.names = FALSE)
    







