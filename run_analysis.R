# Getting and Cleaning Data Course Project: run_analysis
# by Jacqueline Mae Virtudes
# Jan 21, 2018, Feb 8, 2018


# This script:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

#Sample Dataset to be processed: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#data collected from the accelerometers from the Samsung Galaxy S smartphone
#Human Activity Recognition Using Smartphones Dataset Version 1.0

library(dplyr)
date = as.Date(Sys.time())

#downloading and unzipping the files
#setwd("C:...")
URL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#save ".zip" file and unzip to working directory 
df<- download.file(URL, destfile =  "./pw4/UCI_HAR_DATASET.zip")
files<- unzip(zipfile = "./pw4/UCI_HAR_DATASET.zip", exdir = "./pw4", list = TRUE)

# 1. Merge train and test sets to create one data frame

#read txt file of test and training sets
subject_test<-read.table("./pw4/UCI HAR Dataset/test/subject_test.txt")
x_test<- read.table("./pw4/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./pw4/UCI HAR Dataset/test/y_test.txt")

subject_train<-read.table("./pw4/UCI HAR Dataset/train/subject_train.txt")
x_train<- read.table("./pw4/UCI HAR Dataset/train/X_train.txt")
y_train<- read.table("./pw4/UCI HAR Dataset/train/y_train.txt")

#call feature vector for column names of train & test and activity labels for activity number
activity_labels<- read.table("./pw4/UCI HAR Dataset/activity_labels.txt")
features<- read.table("./pw4/UCI HAR Dataset/features.txt")

#name columns per dataset
colnames(subject_test)<- "subject"  
colnames(x_test)<- as.character(features[,2])   #test set
colnames(y_test)<- "activity_number" #test label
colnames(subject_train)<- "subject"
colnames(y_train)<- "activity_number" #training label
colnames(x_train)<- as.character(features[,2])  #training set
colnames(activity_labels)<- c('activity_number', 'activity_name')  #class labels and activty name

#merging test and train dataset
test_set<- cbind( y_test,subject_test, x_test)
train_set<- cbind(y_train, subject_train, x_train )
merge_datasets<- rbind(train_set,test_set)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# extracting colnames with mean and std stored in a vector and include activity_number for item 4
column_names<- names(merge_datasets)  #names fro pattern mattching
extract_df<- (grepl("activity_number|subject", column_names)| grepl("mean|std", column_names))
extracted_dataset<- merge_datasets[,extract_df==TRUE] #extracted dataset of mean and standard deviation

# 4. Appropriately labels the data set with descriptive variable names.
#merge activity labels with corresponding activity number in the dataset
extracted_dataset<- merge(extracted_dataset, activity_labels, by = 'activity_number', all.x=TRUE)
#arrange_dataset<- arrange_all()
#complete variable names, descriptive, no whitespaces, not duplicated
colnames(extracted_dataset)<- gsub("-std()","StDev",names(extracted_dataset)) 
colnames(extracted_dataset)<- gsub("-mean()","Mean",names(extracted_dataset))
colnames(extracted_dataset)<- gsub("^t", "Time", names(extracted_dataset))
colnames(extracted_dataset)<- gsub("^f", "Frequency", names(extracted_dataset))
colnames(extracted_dataset)<- gsub("Acc", "Accelerometer", names(extracted_dataset))
colnames(extracted_dataset)<- gsub("Gyro", "Gyroscope", names(extracted_dataset))
colnames(extracted_dataset)<- gsub("Mag", "Magnitude", names(extracted_dataset))
colnames(extracted_dataset)<- gsub("BodyBody", "Body", names(extracted_dataset))
#View(extracted_dataset)

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

tidy_dataset <- aggregate(. ~subject + activity_number, extracted_dataset, mean)
tidy_dataset <- tidy_dataset[order(tidy_dataset$subject,tidy_dataset$activity_number),]

# Export the tidyData set to .txt
write.table(tidy_dataset, './pw4/UCI HAR Dataset/UCIHAR_tidy_dataset.txt',row.names=FALSE,sep='\t')
