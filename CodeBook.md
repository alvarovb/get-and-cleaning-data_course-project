==================================================================
# Code Book: 
##Tidy Dataset of the Human Activity Recognition Using Smartphones Dataset

==================================================================
This R script has been made entirely for academic purpose, the data set has been collected by [Center for Machine Learning and Intelligent Systems](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from a group of 30 volunteers (get it [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )). Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waists using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

For information of how to run the R script, please refer to the README.md  

Features description:
======================================

The features selected for this dataset comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. ***Each features are normalized and bounded within [-1,1]***.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).


###Notes:

For more information, please refer to the "README.txt", "features.txt", "features_info.txt" and "activity_labels.txt" from the original data set[link].
 
Feature Selection and data set transformation
==============================================
The data set used for the making of the tidy data set, was the obtained by merging the training and the test sets. For this the following files where used:

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Activity labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Activity labels.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Only the measurements on the mean and standard deviation for each measurement where extracted. As follows, a description of the naming conventions of the extracted features:

- subject
- action

The set of variables that were estimated from these signals are:

- mean: Mean value
- std: Standard deviation

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-[mean|std]-[X|Y|Z]
- tGravityAcc-[mean|std]-[X|Y|Z]
- tBodyAccJerk-[mean|std]-[X|Y|Z]
- tBodyGyro-[mean|std]-[X|Y|Z]
- tBodyGyroJerk-[mean|std]-[X|Y|Z]
- tBodyAccMag-[mean|std]
- tGravityAccMag-[mean|std]
- tBodyAccJerkMag-[mean|std]
- tBodyGyroMag-[mean|std]
- tBodyGyroJerkMag-[mean|std]
- fBodyAcc-XYZ-[mean|std]
- fBodyAccJerk-[mean|std]-[X|Y|Z]
- fBodyGyro-XYZ-[mean|std]
- fBodyAccMag-[mean|std]
- fBodyAccJerkMag-[mean|std]
- fBodyGyroMag-[mean|std]
- fBodyGyroJerkMag-[mean|std]


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Based on the "activity_labels.txt" file from the original data set, the values of the activity column was updated, using the following transformation rule:
1 = "WALKING"
2 = "WALKING_UPSTAIRS"
3 = "WALKING_DOWNSTAIRS"
4 = "SITTING"
5 = "STANDING"
6 = "LAYING"

Finally,  an independent tidy data set with the average of each variable for each activity and each subject was created.



