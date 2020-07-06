# Coursera Course Project - Cleaning & Getting Data 

# Load libraries:

# install.packager("dplyr)
library(dplyr)

# In first place we should download and unzip the files, then read the data.

# 1. Reading data in tables and naming columns

features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("number","functions"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")


# Task 1: Merge the training and the test sets to create one data set.
# Reminder: The obtained initial dataset has been randomly partitioned into two sets, where 70% 
# of the volunteers was selected generating the training data and 30% the test data.

x <- rbind(x_train,x_test)
y <- rbind(y_train, y_test)
subject <-  rbind(subject_train,subject_test)

# Solution 1: One data set

MergedData <- cbind(subject,x,y)

# Task 2: Extract only the measurements on the mean and standard deviation for each measurement.

ExtractedData <- MergedData %>% select(subject, code, contains("mean"), contains("std"))


# Task 3: Use descriptive ativity names to name the activities variable names.

ExtractedData$code <- activities[ExtractedData$code, 2]

# Task 4: Appropriately labels the data set with descriptive variable names.
names(ExtractedData)[1] = "Subject"
names(ExtractedData)[2] = "Activity"
names(ExtractedData)<-gsub("Acc", "Accelerometer", names(ExtractedData))
names(ExtractedData)<-gsub("Gyro", "Gyroscope", names(ExtractedData))
names(ExtractedData)<-gsub("BodyBody", "Body", names(ExtractedData))
names(ExtractedData)<-gsub("Mag", "Magnitude", names(ExtractedData))
names(ExtractedData)<-gsub("^t", "Time", names(ExtractedData))
names(ExtractedData)<-gsub("^f", "Frequency", names(ExtractedData))
names(ExtractedData)<-gsub("tBody", "TimeBody", names(ExtractedData))
names(ExtractedData)<-gsub("-mean()", "Mean", names(ExtractedData), ignore.case = TRUE)
names(ExtractedData)<-gsub("-std()", "STD", names(ExtractedData), ignore.case = TRUE)
names(ExtractedData)<-gsub("-freq()", "Frequency", names(ExtractedData), ignore.case = TRUE)
names(ExtractedData)<-gsub("angle", "Angle", names(ExtractedData))
names(ExtractedData)<-gsub("gravity", "Gravity", names(ExtractedData))


# Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.

AverageData <- ExtractedData %>%
        group_by(Subject,Activity) %>%
        summarise_all(funs(mean))
write.table(AverageData, "AverageData.txt", row.names = F)

