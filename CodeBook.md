# CodeBook
## Getting and Cleaning Data: course project
by Peter Peng

# Description

This doc describes the data and how the transformation is done on the source data to get a tidy dataset.

# Source data
The source data are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Goal
The goal of the transformation on the source data is to get a tidy dataset, which satisfies the following criteria:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Variables
The final tidy data set contains following variables:
subjectId, activityName, followed by a serial of measurement variables.  
SubjectId identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
ActivityName includes following activities performed by a subject wearing a smartphone

* WALKING,
* WALKING_UPSTAIRS,
* WALKING_DOWNSTAIRS,
* SITTING,
* STANDING,
* LAYING

The measurement variables is the combination of signals and calculating variables. 

The following signals are found in the data set:

* tBodyAcc-XYZ: Body accelaration in time domain
* tGravityAcc-XYZ: Gravity accelaration in time domain
* tBodyAccJerk-XYZ: Body acceleration Jerk in time domain
* tBodyGyro-XYZ: Body gyroscopic in time domain
* tBodyGyroJerk-XYZ: Body gyroscopic Jerk in time domain
* tBodyAccMag: Body acceleration Mgnitude in time domain
* tGravityAccMag: Gravity acceleration Mgnitude in time domain
* tBodyAccJerkMag: Body acceleration Jerk Magnitude in time domain
* tBodyGyroMag: Body gyroscopic Magnitude in time domain
* tBodyGyroJerkMag: Body gyroscopic Jerk Magnitude in time domain
* fBodyAcc-XYZ: Body accelaration in frequency domain
* fBodyAccJerk-XYZ: Body accelaration Jerk in frequency domain
* fBodyGyro-XYZ: Body gyroscopic in frequency domain
* fBodyAccMag: Body accelaration Magnitude in frequency domain
* fBodyAccJerkMag: Body accelaration Jerk Magnitude in frequency domain
* fBodyGyroMag: Body gyroscopic Magnitude in frequency domain
* fBodyGyroJerkMag: Body gyroscopic Jerk Magnitude in frequency domain

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of calculating variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation


# Code explanation
This section explains the script code which does the transformation:
* Line 8: read the file "features.txt". This file contains all the column names for data set later we will work on.
* Line 10: we defined a function ,which is used to read the 2 data set files for train and test. This function also reads
the file for all the subjects and activities for the data set. After 3 files are read, we then join those 3 files to
get complete data set, which has readable column names for all variables and activity id for each row.
* Line 42: we combined 2 data sets for train and test to 1 complete data set.
* Line 44 to 47: we read the file for activity labels and join it to the complete data set, thus each row in the complete data
set has a readable activity name.
* Line 51: by using tidyr, we gather all measurement variables to a single variable "measurement".
* Line 53: we calculate the avg for each measurement variable.
* Line 55: we spread each measurement variable to its own column.