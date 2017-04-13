####################################################################################################################################
##                                          Written by Soumik Ray on 13-APR-2017                                                 ###  
## This R script runs on the data collected from the accelerometers from the Samsung Galaxy S smartphone and does the following :###
## 1.Merges the training and the test sets to create one data set.                                                               ###
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.                                     ###
## 3.Uses descriptive activity names to name the activities in the data set                                                      ###
## 4.Appropriately labels the data set with descriptive variable names.                                                          ###
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable                  ###
##   for each activity and each subject.                                                                                         ###
####################################################################################################################################

- Following R packages are needed to run the script: dplyr, reshape2

- This code assumes that the working directory is set and the data files are aready downloaded and kept in the SAMSUMG folder under the working directory

- The code has the following flow of logic -
	
	- Get the test and train subject data. Name the column as "subjectid"
	- Merge both the datasets to create a single one using rbind function
	- Load the activity labels and name the columns as "activityid" and "actlabels"
	- Load the feature labels and name them as "featureid" and "featurelabels"
	- Load the feature data for both test and train and merge them into one
	- Extrat the mean and SD columsn from the feature labels and subset the combines feature dataset based on them
	- Add descriptive column names to the feature dataset
	- Create a dataset combining subjects, activity labels (descriptive activity names) and feature datasets
	- Create another combined datasets with activity ids to preserve the factor levels
	- Convert the dataset to tidy data format by converting from wide to long format data using melt
	- Finally, from the long format data, find the aggregate means of each variable for each activity and subject
	- Write the resultant dataset to a text file