**Getting & Cleaning Data - Course Project**
===========================================

## Initial data set information
The goal is to prepare tidy data that can be used for later analysis. The data in this project has been collected from the accelerometers from the Samsung Galaxy S II smartphone. The experiments have been carried out with a group of 30 volunteers within 19-48 years. Each person performed six activities: walking, walking_upstairs, walking_downstairs, sitting, standing, laying. Using the embedded accelerometer and gyroscope, it was captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected generating the training data and 30% the test data. 

Further data information link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The dataset includes the following files:

  1. ***features.txt*** 
  2. ***train/X_train.txt*** 
  3. ***test/X_test.txt***
  4. ***train/subject_train.txt***
  5. ***test/subject_test.txt***
  6. ***train/y_train.txt*** 
  7. ***test/y_test.txt*** 


## Script: run_analysis.R
Very important: install the library dplyr.

1. Download and read in tables the datasets.
2. Rename correctly the columns of each dataset. Using read.table and col.names.
3. Merge all the datatables into one using the rbind and cbind function. 
4. In order to extract tidy data, we can use the select and contains function.
5. We can rename properly the columns and lables the data set by using gsub function. 
