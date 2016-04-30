##Getting and Cleaning Data Course Project CodeBook
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:
Read X_test.txt, y_test.txt and subject_test.txt from the "./data/UCI HAR Dataset/test" folder and store them in dataFeaturesTest, dataActivityTest and dataSubjectTest variables respectively.

Read X_train.txt, y_train.txt and subject_train.txt from the "./data/UCI HAR Dataset/train" folder and store them in dataFeaturesTrain, dataActivityTrain and dataSubjectTrain variables respectively.

Read features.txt from the "./data/UCI HAR Dataset" folder and store it in dataFeaturesNames variable.

Use rbind() on same type of data and cbind() to merge all data into Data Variable.

subset the Data Variable to include only Mean() and std() columns into a variable called Data1.

Read the activity_labels.txt file from the "./data/UCI HAR Dataset" folder and store the data in a variable called dataActivityLabels.

Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.
Transform the values of Data$activity according to the dataActivityLabels data frame.

Clean the names of the columns to be more desciptive ( no abbreviations ) i.e. Capitalize, complete abbreviated words etc.

Finally, generate a second independent tidy data set named Data2 with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. 

Write the result out to "tidydata.txt" file in current working directory.