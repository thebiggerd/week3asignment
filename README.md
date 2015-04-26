 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code is marked accordingly for the steps above. 

The code works by first loading the individual datasets from the files. Then I load the meta data.

The code proceeds to merge the data and set the colnames to be more descriptinve from the meta data sets.

I then set the activity column to be move descriptive for users to see.  

I extract the mean and sd columns, and finally create and write a tidy dataset. 
