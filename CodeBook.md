About source data

As sourse data for work was used Human Activity Recognition Using Smartphones Data Set. Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script

File with R code "run_analysis.R" perform 5 following steps:
1. Merging the training and the test sets to create one data set.
     1.1 Reading files
       1.1.1 Reading trainings tables
       1.1.2 Reading testing tables
       1.1.3 Reading feature vector
       1.1.4 Reading activity labels
     1.2 Assigning column names
     1.3 Merging all data in one set
2. Extracting only the measurements on the mean and standard deviation for each measurement
     2.1 Reading column names
     2.2 Create vector for defining ID, mean and standard deviation
     2.3 Making nessesary subset from setAllInOne
3. Using descriptive activity names to name the activities in the data set

4. Appropriately labeling the data set with descriptive variable names
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
     5.1 Making second tidy data set
     5.2 Writing second tidy data set in txt file

About variables:

subtrain,xtrain, ytrain, subtest, xtest, ytest, has data from the downloaded files.

mrg_train, mrg_test and setAllData for merge the previous datasets to further analysis.
features contains the correct names for the mrg_train dataset, which are applied to the column names stored in


Manipulating data

Merges test data and trainning data to setAllData 

Indentifies the mean and std columns (plus Activity and Subject) to meanAndStdCols
Extracts the required measurements on the mean and standard deviation for each measurement 
 data.frame (called setForMeanAndStd).  
created activities and labelled appropriately




