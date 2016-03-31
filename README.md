# README script run_analysis
JPS  
March 29, 2016  

#### Summary of stept-actions of script *run_analysis* 
0 - Load libraries and download data.     
1 - Merges the training and the test sets to create one data set.     
2 - Extracts only the measurements on the mean and standard deviation for each measurement.     
3 - Uses descriptive activity names to name the activities in the data set.     
4 - Appropriately labels the data set with descriptive variable names.     
5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.       
These steps are indicated throughout the script for faciiltating the identification of each step.      

**Data Source**: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip     
**Original Data Information**: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Complementary Information**: codebook.md should be consulted jointly with the codebook of the original data, as it expands on it, rather than replacing it.


####Description of the Analysis Process     
Notes:     

* The steps for downloading data are 'masked'as notes on the script to avoid lengthy repeated downloads when the data is already local.

* The script *run_analysis.R* downloads accelerameter data from the source indicated above.     
The Codebook does not replace, but rather completes, the information about the original data, which can be found through the link indicated above.

#####Summary
The script joins training and testing data into one table. In the process, it keeps only variables which refer to mean and standard deviation of some measurement (see codebook for more info). It proceeds to compute the means of each one of the measurements per activity and subject.      

The script is documented throughout and includes a summary of each of five steps, as summarized above.
In the script, the data download is added as a note to avoid unnecessary repetition of such task, but can be used on the first run if the Samsung data is not in the working directory.       
After downloading the data, the script loads the test and train data to variables. It also loads the features file to identify the names of variables used in the test and train data.       

The test and train datasets are similar in structure, varying only on the number of rows(subjects). The x files consist of accelerometer data, which is loaded into a data frame, each of the 561 measurements (variables) per column.
The feature and activities files are both imported to data frames with two columns each. The variables of the train and test files named after the column of features which contains the names of the variables in order. Once named, test and train are merged (vertically, `rbind()`), including data for all participants (test and train) in one data frame. The outcome is then added (horizontally, `cbind()`) with the data frame with subject ids and activity type (`testTrainSet`). 

The column of the data frame containing the variable names is parsed (string-based, `grep()`) to identify all instances where the measurement is either a mean or a standard deviation (std). Once identified, an index vector with their positions is used to eliminate the columns from the main dataset (`testTrainSet`), resulting in `testTrainSetmeanStd`. 
Activity labels are imported to a data frame with two variables, a code and a description. This data frame is merged with `testTrainSetmeanStd` based on the activity code, providing descriptive labels for each activity on the main table (`testTrainSetmeanStdActivityLabels`).   

#####Final Output - `testTrainSetmeanStdActivityLabels`
The resulting dataset is converted into a tidy dataset by grouping subjects and activities so that each row corresponds to a unique observation, and each variable is stored in one column. 


