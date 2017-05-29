# Getting and Cleaning Data: Project
# Overview

This repository contains the all the materials required by the project assignment for the course "Get And Clean Data" on coursera.

# How to run the script
Clone this repo to your local computer. Open the script 'run_analysis.R' in your RStudio and change the working dir to your repo dir line 4. Then run the script 'run_analysis.R'.
An output file "avgData.txt" containing a tidy data set will be generated in your working dir.

# Script Summary
The script does the following:

* Reads the data file in the folder "UCI_HAR_Dataset".
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

_**Attention**_: **please install packages "dplyr" and "tidyr" before running the script.**  

More detailed explanation on the script can ben found in the file [CodeBook.md](https://github.com/PeterPeng2017/GetAndCleanData/blob/master/CodeBook.md)

# About source data
The folder "UCI_HAR_Dataset" contains the source data from which the final tidy data is generated.
More information about the source data can be found in the file "README.txt" in that folder.
