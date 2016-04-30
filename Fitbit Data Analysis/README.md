##Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip in the folder named "data".
Make sure the folder "data" and the run_analysis.R script are both in the current working directory.

Second, use source("run_analysis.R") command in RStudio.

Third, you will find 1 output file is generated in the current working directory:
tidydata.txt (792.7KB): it contains a data frame called result with 180obs and 479 variables.

Finally, use data <- read.table("tidydata.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total.
