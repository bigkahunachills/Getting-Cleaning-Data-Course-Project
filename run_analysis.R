#Set Working Directory
setwd("C:/R/Coursera/RStudioCoursera/UCI HAR Dataset")

#Read data
activity_labels<-read.table("./activity_labels.txt")
features<-read.table("./features.txt")

subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")

#1. Merges the training and the test sets to create one data set.
#add column names
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

names(X_train) <- features$V2
names(X_test) <- features$V2


names(y_train) <- "activity"
names(y_test) <- "activity"

colnames(activity_labels)<-c("activity","activityType")

# merge files
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
merged <- rbind(train, test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <-merged[,grepl("mean|std|subject|activityId",colnames(merged))]

#3. Uses descriptive activity names to name the activities in the data set
library(plyr)
act_merged <- join(merged, activity_labels, by = "activity", match = "first")
#act_merged <-act_merged[,-1]

#4. Appropriately labels the data set with descriptive variable names.

#Remove parentheses

names(act_merged) <- gsub("\\(|\\)", "", names(act_merged), perl  = TRUE)

#correct syntax in names

names(act_merged) <- make.names(names(act_merged))

#add descriptive names

names(act_merged) <- gsub("Acc", "Acceleration", names(act_merged))
names(act_merged) <- gsub("^t", "Time", names(act_merged))
names(act_merged) <- gsub("^f", "Frequency", names(act_merged))
names(act_merged) <- gsub("BodyBody", "Body", names(act_merged))
names(act_merged) <- gsub("mean", "Mean", names(act_merged))
names(act_merged) <- gsub("std", "Std", names(act_merged))
names(act_merged) <- gsub("Freq", "Frequency", names(act_merged))
names(act_merged) <- gsub("Mag", "Magnitude", names(act_merged))

#5.From the data set in step 4, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject.

tidydata_average_sub<- ddply(act_merged, c("subjectID","activity"), numcolwise(mean))


write.table(tidydata_average_sub,file="tidydata.txt")
