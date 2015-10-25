# GettingAndCleaningDataProject
Repository for the Getting and Cleaning Data Course Project on Coursera

This repository contains:
1. run_analysis.R
2. code book

The project uses data from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The project requirements are as followins

You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Additional Notes
The training and test data sets were merged along with the training and test labels specifying which rows corresponded to the activity and which corresponded to the subject.  Column labels were also attached to the merged data.

Only those column which contained the phrase "mean" and "std" were selected.

The activity column values were converted to string.  Then replaced with the corresponding string label in activity_labels.txt.

Appropriately labelling variable names were conducted by: 1. removing all instances of '-' with gsub.  2. Removing the '()'. 3. Replacing all instances of "Acc" with Acceleration. 4. Replacing all instances of "gyro" with gyroscope. 5. Turnning all text to lower case.

The tidy data set was created by first group the data according to activity and subject then summarising the data by applying the mean function.  This created a wide format tidy dataset instead of the long format.

Finally write.table() was used to create the tidyDataAssignment.txt file containing the tidy data.
