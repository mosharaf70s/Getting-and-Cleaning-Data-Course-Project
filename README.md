# Getting-and-Cleaning-Data-Project
This is a Coursera project for the Getting and Cleaning Data module on its 4th week. This repo contains a script called run_analysis.R, a tidy data set and a CodeBook.md.

run_analysis.R - is the required script for the project. This script downloads the compressed file which is obtianed from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and has the ".zip" file downloaded in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The dataset is called the Human Activity Recognition using Smartphones dataset version 1.0 by the authors, J.L.R Ortiz, D. Anguita, et al(2012). From its README.txt:
    
'The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.'

The dataset has separate text files of training and test sets, feature vectors, and activity labels. These raw datasets are to be cleaned or arranged for the data to be properly processed and comprehensive. The goal of cleaning the dataset is to summarize the training and test sets by computing the average of each variables (feature vectors) for each activity and each subject.

Upon obtaining the data, it performs the following algorithm:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set 
 with the average of each variable for each activity and each subject.

This also outputs a text file of the tidy dataset.
