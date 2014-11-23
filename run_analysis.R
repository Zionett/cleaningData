## This is an R script for merging and cleaning motion sensor data from
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## The data is downloaded and the "UCI HAR Dataset" folder is in the work directory

## Read in all the relevant files

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Merge the subject labels, sensor data, and activity labels

test_data <- cbind(subject_test, X_test, y_test)
train_data <- cbind(subject_train, X_train, y_train)

## Merge the training and test data sets

data <- rbind(test_data, train_data)

## Read in the feature names

feature <- read.table("UCI HAR Dataset/features.txt")

## Assign column names to data

colnames(data) <- c("subject.id", make.names(as.character(feature[[2]])), "activity")

## Construct a logical vector and select the needed columns
## fixed = TRUE to exclude the meanFreq columns

index <- grepl("mean..", colnames(data), fixed = TRUE) | grepl("std..", colnames(data))
index[1] <- TRUE
index[563] <- TRUE
data <- data[,index]

## Replace the activity with descriptive names using factors

act<- read.table("UCI HAR Dataset/activity_labels.txt")
data$activity <- factor(data$activity, c(1,2,3,4,5,6), as.character(act[[2]]))

## Clean up column names
names <- colnames(data)
names <- gsub("\\.\\.\\.", "\\.", names)
names <- gsub("BodyBody", "Body", names)
names <- gsub("\\.\\.$", "", names)
colnames(data) <- names

## Remove data that are no longer useful

remove(subject_test, X_test, y_test)
remove(subject_train, X_train, y_train)
remove(test_data, train_data, feature, act, index, names)

## Compute average for each variable, subject, and activity
aggdata <- aggregate(data[, -c(1,68)], by = list(subject.id = data$subject.id, 
                                        activity = data$activity), FUN = mean)

write.table(aggdata, "data.txt", row.names = FALSE)