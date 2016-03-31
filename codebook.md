# codebook  script run_analysis
Joao Pinelo Silva  
March 29, 2016  

#### Summary Decsription of Dataset and  Variables Created       

Note:       
* Should be consulted jointly with the codebook of the original data, as it expands on it, rather than replacing it.       

####Dataset       
`testTrainSet` - data.table object containing the train and test data for all subjects. Variables: subject (id of the subject as per subject_test.txt and subject_train.txt); value (movement value in same units as x_test.txt and x_train.txt); activity (the activity performed by the subjects as in y_test.txt and y_train.txt)

####Variables            

      
A tidy dataset (`tidySet`) was produced from calculatiing the mean of all variables grouped by activity and subject. Each variable is therefore the mean of the variable with similar name in `features.txt`. The variables created are the following:      
[1] "activitylabel"

[1] "subject"

[1] "activitycode"

[1] "tBodyAcc-mean()-X"

[1] "tBodyAcc-mean()-Y"

[1] "tBodyAcc-mean()-Z"

[1] "tBodyAcc-std()-X"

[1] "tBodyAcc-std()-Y"

[1] "tBodyAcc-std()-Z"

[1] "tGravityAcc-mean()-X"

[1] "tGravityAcc-mean()-Y"

[1] "tGravityAcc-mean()-Z"

[1] "tGravityAcc-std()-X"

[1] "tGravityAcc-std()-Y"

[1] "tGravityAcc-std()-Z"

[1] "tBodyAccJerk-mean()-X"

[1] "tBodyAccJerk-mean()-Y"

[1] "tBodyAccJerk-mean()-Z"

[1] "tBodyAccJerk-std()-X"

[1] "tBodyAccJerk-std()-Y"

[1] "tBodyAccJerk-std()-Z"

[1] "tBodyGyro-mean()-X"

[1] "tBodyGyro-mean()-Y"

[1] "tBodyGyro-mean()-Z"

[1] "tBodyGyro-std()-X"

[1] "tBodyGyro-std()-Y"

[1] "tBodyGyro-std()-Z"

[1] "tBodyGyroJerk-mean()-X"

[1] "tBodyGyroJerk-mean()-Y"

[1] "tBodyGyroJerk-mean()-Z"

[1] "tBodyGyroJerk-std()-X"

[1] "tBodyGyroJerk-std()-Y"

[1] "tBodyGyroJerk-std()-Z"

[1] "tBodyAccMag-mean()"

[1] "tBodyAccMag-std()"

[1] "tGravityAccMag-mean()"

[1] "tGravityAccMag-std()"

[1] "tBodyAccJerkMag-mean()"

[1] "tBodyAccJerkMag-std()"

[1] "tBodyGyroMag-mean()"

[1] "tBodyGyroMag-std()"

[1] "tBodyGyroJerkMag-mean()"

[1] "tBodyGyroJerkMag-std()"

[1] "fBodyAcc-mean()-X"

[1] "fBodyAcc-mean()-Y"

[1] "fBodyAcc-mean()-Z"

[1] "fBodyAcc-std()-X"

[1] "fBodyAcc-std()-Y"

[1] "fBodyAcc-std()-Z"

[1] "fBodyAcc-meanFreq()-X"

[1] "fBodyAcc-meanFreq()-Y"

[1] "fBodyAcc-meanFreq()-Z"

[1] "fBodyAccJerk-mean()-X"

[1] "fBodyAccJerk-mean()-Y"

[1] "fBodyAccJerk-mean()-Z"

[1] "fBodyAccJerk-std()-X"

[1] "fBodyAccJerk-std()-Y"

[1] "fBodyAccJerk-std()-Z"

[1] "fBodyAccJerk-meanFreq()-X"

[1] "fBodyAccJerk-meanFreq()-Y"

[1] "fBodyAccJerk-meanFreq()-Z"

[1] "fBodyGyro-mean()-X"

[1] "fBodyGyro-mean()-Y"

[1] "fBodyGyro-mean()-Z"

[1] "fBodyGyro-std()-X"

[1] "fBodyGyro-std()-Y"

[1] "fBodyGyro-std()-Z"

[1] "fBodyGyro-meanFreq()-X"

[1] "fBodyGyro-meanFreq()-Y"

[1] "fBodyGyro-meanFreq()-Z"

[1] "fBodyAccMag-mean()"

[1] "fBodyAccMag-std()"

[1] "fBodyAccMag-meanFreq()"

[1] "fBodyBodyAccJerkMag-mean()"

[1] "fBodyBodyAccJerkMag-std()"

[1] "fBodyBodyAccJerkMag-meanFreq()"

[1] "fBodyBodyGyroMag-mean()"

[1] "fBodyBodyGyroMag-std()"

[1] "fBodyBodyGyroMag-meanFreq()"

[1] "fBodyBodyGyroJerkMag-mean()"

[1] "fBodyBodyGyroJerkMag-std()"

[1] "fBodyBodyGyroJerkMag-meanFreq()"

[1] "angle(tBodyAccMean,gravity)"

[1] "angle(tBodyAccJerkMean),gravityMean)"

[1] "angle(tBodyGyroMean,gravityMean)"

[1] "angle(tBodyGyroJerkMean,gravityMean)"

[1] "angle(X,gravityMean)"

[1] "angle(Y,gravityMean)"

[1] "angle(Z,gravityMean)"
