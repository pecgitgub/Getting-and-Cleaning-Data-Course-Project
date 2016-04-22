library(data.table) 
library(plyr)
library(dplyr)

setwd("c://Datascince")
Downloading and unzipping dataset
if(!file.exists("./c3w4")){dir.create("./c3w4")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./c3w4/Dataset.zip")
unzip(zipfile="./c3w4/Dataset.zip",exdir="./c3w4")


##Merges the training and the test sets to create one data set.

## 2.1 Reading files
Read Training data
subtrain <- read.table("./c3w4/UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./c3w4/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./c3w4/UCI HAR Dataset/train/Y_train.txt")

## Read Test data
subtest <- read.table("./c3w4/UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./c3w4/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./c3w4/UCI HAR Dataset/test/Y_test.txt")

features <- read.table("./c3w4/UCI HAR Dataset/features.txt")
activityLabels <- read.table("./c3w4/UCI HAR Dataset/activity_labels.txt")

## Assigning columns
colnames(xtrain) <- features[,2]
colnames(ytrain) <- "activityId"
colnames(subtrain) <- "subjectId"

colnames(xtest) <- features[,2]
colnames(ytest) <- "activityId"
colnames(subtest) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')


## Merge all data in on set
mrg_train <- cbind(ytrain,subtrain,xtrain)
mrg_test <- cbind(ytest,subtest,xtest)
setAlldata <- rbind(mrg_train,mrg_test)


## Extracts only the measurements on the mean and standard deviation for each measurement.

## reading column names:

colNames <- colnames(setAlldata)

## creating a vector for defining id, mean, standard deviation
mean_and_std <- (grepl("activityId", colNames) |
                 grepl("subjectId",colNames) |
                  grepl("mean..",colNames) |
                  grepl("std..",colNames))


setForMeanAndStd <- setAlldata[,mean_and_std ==TRUE]

## Uses descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMeanAndStd,activityLabels,by='activityId',all.x=TRUE)

## Appropriately labels the data set with descriptive variable names.

secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each ## activity and each subject.
secTidySet <-secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
write.table(secTidySet, "./c3w4/UCI HAR Dataset/secTidySet.txt",row.name=FALSE)








