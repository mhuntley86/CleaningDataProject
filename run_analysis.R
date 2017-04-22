###############################################################
##                                                           ##
##                                                           ##
##  Author: Matt Huntley                                     ##
##  Purpose: Coursera project - Getting and Cleaning Data    ##
##                                                           ##
##                                                           ##
###############################################################


#
# SUMMARY OF DATA FILES READ IN THIS SCRIPT
#
# features.txt : List of all features.
# activity_labels.txt : Links the class labels with their activity name.
# test/subject_test.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
# test/X_test.txt : Test set.
# test/y_test.txt : Test labels.
# train/subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
# train/X_train.txt : Training set.
# train/y_train.txt : Training labels.
#


# SET FILENAMES FOR FILES USED IN THIS SCRIPT
#############################################

working_directory <- "C:/Users/Matt/Documents/DataScience/UCI HAR Dataset/"

# Input data (relative to working directory)
file_features <- "features.txt"
file_activity_labels <- "activity_labels.txt"
file_subject_test <- "test/subject_test.txt"
file_x_test <- "test/X_test.txt"
file_y_test <- "test/y_test.txt"
file_subject_train <- "train/subject_train.txt"
file_x_train <- "train/X_train.txt"
file_y_train <- "train/y_train.txt"

# Output File
file_output <- "cleaned_data.txt"


#              START SCRIPT
#############################################

# Load necessary libraries

library(data.table)
library(dplyr)


# Set working directory

setwd(working_directory)


# Read all files

# Labels
features <- fread(file_features, header=FALSE)
activity_labels <- fread(file_activity_labels, header=FALSE)

# Test data
subject_test <- fread(file_subject_test, header=FALSE)
x_test <- fread(file_x_test, header=FALSE)
y_test <- fread(file_y_test, header=FALSE)

# Training data
subject_train <- fread(file_subject_train, header=FALSE)
x_train <- fread(file_x_train, header=FALSE)
y_train <- fread(file_y_train, header=FALSE)


# Clean up column names to prevent illegal characters, 
# per documentation here: https://cran.r-project.org/doc/FAQ/R-FAQ.html#What-are-valid-names_003f
# and removes duplicate dots.  Then column names are assigned to tables.
# Steps: 1) remove 2+ dots and replace with single dot, 2) where lowercase is immediately followed
# by uppercase letter, add dot to seperate, 3) remove trailing dots.

features$V2 <- make.names(names=features$V2, unique=TRUE, allow_ = TRUE)
features$V2 <- gsub("\\.{2,}", ".", features$V2)
features$V2 <- gsub("([a-z])([A-Z])", "\\1.\\2", features$V2)
features$V2 <- gsub("\\.$", "", features$V2)

colnames(activity_labels) <- c("activityId", "activityName")
colnames(subject_test) <- "subjectId"
colnames(x_test) <- features$V2
colnames(y_test) <- "activityId"

colnames(subject_train) <- "subjectId"
colnames(x_train) <- features$V2
colnames(y_train) <- "activityId"


# Join measurements with subject and activity data, for each training and test data

test_merged <- mutate(x_test, subjectId = 0, activityId = 0)
test_merged$subjectId <- subject_test$subjectId
test_merged$activityId <- y_test$activityId
train_merged <- mutate(x_train, subjectId = 0, activityId = 0)
train_merged$subjectId <- subject_train$subjectId
train_merged$activityId <- y_train$activityId


# Combine test and training data and format as tbl_df

all_data <- rbind(train_merged, test_merged, use.names = TRUE)
all_data <- tbl_df(all_data)


# Select ID fields along with mean and std dev fields. Dropping 'angle' fields since they were averaged over a window (per info document)

filtered_data <- select(all_data, matches("activityId|subjectId|mean|std"), -contains("angle"))


# Clean up separated data

rm(x_test, x_train, y_test, y_train, subject_test, subject_train, test_merged, train_merged, all_data)


# Replace activityId with name (labeled as Activity) and move subject and activity to front to make more readable

filtered_data <- inner_join(filtered_data, activity_labels)
filtered_data <- select(filtered_data, subjectId, Activity = activityName, everything())
filtered_data <- select(filtered_data, -activityId)


# Make column names more readable by making more descriptive (insights pulled from features_info.txt).  Swapping out abbreviations used.

names(filtered_data) <- gsub("^t", "TimeDomain", names(filtered_data))
names(filtered_data) <- gsub("^f", "FrequencyDomain", names(filtered_data))
names(filtered_data) <- gsub("\\.([a-z])", "\\.\\U\\1\\E", names(filtered_data), perl = TRUE)
names(filtered_data) <- gsub("Acc", "Accelerometer", names(filtered_data))
names(filtered_data) <- gsub("Gyro", "Gyroscope", names(filtered_data))
names(filtered_data) <- gsub("Freq", "Frequency", names(filtered_data))
names(filtered_data) <- gsub("Mag", "Magnitude", names(filtered_data))
names(filtered_data) <- gsub("Body.Body", "Body", names(filtered_data)) # not sure why body appears twice in some.
names(filtered_data)


# Create new dataset with mean of each variable for each activity and each subject

grouped <- group_by(filtered_data, subjectId, Activity)
summary <- summarize_each(grouped, funs(mean))


# Write output file with clean data

write.table(summary,file=file_output, row.names = FALSE)

# Clean up large variables
rm(activity_labels, features, filtered_data, grouped)