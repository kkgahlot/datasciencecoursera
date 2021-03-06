# Code book for course project of "Getting and Cleaning data" course

The contents of this code book are modified version of the codebook provided along with data set. The modifications are for describing the changes that were made as part of this course project.

## Description of original data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variable description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Finally the data set is grouped by SubjectID and activityName. Then Average is calculated for each of the measured value across each group that was created by grouping the data. Each row in `groupedAvgDataStep5.txt` corresponds to one group of SubjectID and activityName. Each row contains SubjectID, activityName and mean of all the data points specified above.

Following are the variable names:

* SubjectID
* activityName
* Average tBodyAcc-mean()-X
* Average tBodyAcc-mean()-Y
* Average tBodyAcc-mean()-Z
* Average tBodyAcc-std()-X
* Average tBodyAcc-std()-Y
* Average tBodyAcc-std()-Z
* Average tGravityAcc-mean()-X
* Average tGravityAcc-mean()-Y
* Average tGravityAcc-mean()-Z
* Average tGravityAcc-std()-X
* Average tGravityAcc-std()-Y
* Average tGravityAcc-std()-Z
* Average tBodyAccJerk-mean()-X
* Average tBodyAccJerk-mean()-Y
* Average tBodyAccJerk-mean()-Z
* Average tBodyAccJerk-std()-X
* Average tBodyAccJerk-std()-Y
* Average tBodyAccJerk-std()-Z
* Average tBodyGyro-mean()-X
* Average tBodyGyro-mean()-Y
* Average tBodyGyro-mean()-Z
* Average tBodyGyro-std()-X
* Average tBodyGyro-std()-Y
* Average tBodyGyro-std()-Z
* Average tBodyGyroJerk-mean()-X
* Average tBodyGyroJerk-mean()-Y
* Average tBodyGyroJerk-mean()-Z
* Average tBodyGyroJerk-std()-X
* Average tBodyGyroJerk-std()-Y
* Average tBodyGyroJerk-std()-Z
* Average tBodyAccMag-mean()
* Average tBodyAccMag-std()
* Average tGravityAccMag-mean()
* Average tGravityAccMag-std()
* Average tBodyAccJerkMag-mean()
* Average tBodyAccJerkMag-std()
* Average tBodyGyroMag-mean()
* Average tBodyGyroMag-std()
* Average tBodyGyroJerkMag-mean()
* Average tBodyGyroJerkMag-std()
* Average fBodyAcc-mean()-X
* Average fBodyAcc-mean()-Y
* Average fBodyAcc-mean()-Z
* Average fBodyAcc-std()-X
* Average fBodyAcc-std()-Y
* Average fBodyAcc-std()-Z
* Average fBodyAccJerk-mean()-X
* Average fBodyAccJerk-mean()-Y
* Average fBodyAccJerk-mean()-Z
* Average fBodyAccJerk-std()-X
* Average fBodyAccJerk-std()-Y
* Average fBodyAccJerk-std()-Z
* Average fBodyGyro-mean()-X
* Average fBodyGyro-mean()-Y
* Average fBodyGyro-mean()-Z
* Average fBodyGyro-std()-X
* Average fBodyGyro-std()-Y
* Average fBodyGyro-std()-Z
* Average fBodyAccMag-mean()
* Average fBodyAccMag-std()
* Average fBodyBodyAccJerkMag-mean()
* Average fBodyBodyAccJerkMag-std()
* Average fBodyBodyGyroMag-mean()
* Average fBodyBodyGyroMag-std()
* Average fBodyBodyGyroJerkMag-mean()
* Average fBodyBodyGyroJerkMag-std()

## License
Copied from original README.txt file.

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

