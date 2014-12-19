setwd("~/mydocs/Getting and Cleaning Data/Project")

# Reading features.txt , these are column names for X_train and X_test

features <- read.table("features.txt", header=FALSE, as.is=TRUE, col.names=c("MeasureID", "MeasureName"))

# Train data set
X_train <- read.table("train/X_train.txt", header=FALSE, col.names=features$MeasureName)
y_train <- read.table("train/y_train.txt", header=FALSE, col.names = c("ActivityID"))
subject_train <- read.table("train/subject_train.txt", header=FALSE, col.names = c("SubjectID"))

# grep only on mean and std. dev.
subset_cols <- grep(".*mean\\(\\)|.*std\\(\\)", features$MeasureName)

#keep the data with only mean and std.dev columns
training <- X_train[, subset_cols]

#Add the last two columns (subject ID and activity ID)
training$ActivityID <- y_train$ActivityID
training$SubjectID <- subject_train$SubjectID

# Testing DATA -----------------------

X_test <- read.table("test/X_test.txt", header=FALSE, col.names=features$MeasureName)
y_test <- read.table("test/y_test.txt", header=FALSE, col.names=c("ActivityID"))
subject_test <- read.table("test/subject_test.txt", header=FALSE, col.names = c("SubjectID"))

testing <- X_test[, subset_cols]

#Now add the last two columns (subject and activity)
testing$ActivityID <- y_test$ActivityID
testing$SubjectID <- subject_test$SubjectID

# Merge training and testing sets together
allData <- rbind(training, testing)

col_names <- colnames(allData)
col_names <- gsub("\\.+mean\\.+", col_names, replacement = "Mean")
col_names <- gsub("\\.+std\\.+", col_names, replacement = "Std")
colnames(allData) <- col_names

# Read Activity_label file
activity_labels <- read.table("activity_labels.txt", header = FALSE, as.is=TRUE, col.names = c("ActivityID", "ActivityName"))
activity_labels$ActivityName = as.factor(activity_labels$ActivityName)

merged_data = merge(allData, activity_labels)


library(reshape2)

# Creating a second, independent tidy data set with the 
# average of each variable for each activity and each subject

cols = c("ActivityID", "ActivityName", "SubjectID")
measure_cols = setdiff(colnames(merged_data), cols)
melted_data <- melt(merged_data, id=cols, measure.cols=measure_cols)

# recast 
tidy <- dcast(melted_data, ActivityName + SubjectID ~ variable, mean)
write.table(tidy, "tidy.txt", sep = " ", row.name=FALSE)
