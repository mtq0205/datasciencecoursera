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

# Load the required packages
library(dplyr)
library(reshape2)

# Set the working directory. Assumption is the dataset is already downloaded and SAMSUMG is the folder the contains extracted dataset.
# If not, check if the data directory exists, if not, download the file and unzip it
# This part of the code is not implemented and it is not an explicit requirement for the assignment

home_dir<-"C:/Soumik/Datasets/SAMSUNG"
setwd(home_dir)

# Clear everything from previous run
rm(list = ls())

# Load test and train subject data and merged into one dataset
testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,colClasses="integer",col.names="subjectid")
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,colClasses="integer",col.names="subjectid")
subject<-rbind(testSubject,trainSubject)

# Load activity labels
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names=c("activityid","actlabels"))

# Load feature labels
featureLabels<-read.table("UCI HAR Dataset/features.txt",header=FALSE,sep=" ",col.names=c("featureid","featurelabels"))

# Load test and train feature data and merged into one dataset
testFeatureData<-read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names=featureLabels$featurelabels)
trainFeatureData<-read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names=featureLabels$featurelabels)
featureData<-rbind(testFeatureData,trainFeatureData)

# Extract only the mean and SD columns from the feature data
meanFetInd<-grep("mean\\(\\)",featureLabels$featurelabels)
stdFetInd<-grep("std\\(\\)",featureLabels$featurelabels)
filteredCol<-cbind(meanFetInd,stdFetInd)

# Subset the feature data based on mean and SD columns
featureData<-featureData[,filteredCol]

# Put descriptive variable names
cleanVars<-tolower(gsub("[\\(\\),\\-]","",featureLabels$featurelabels[filteredCol]))
cleanVars<-tolower(gsub("^t","time",cleanVars))
cleanVars<-tolower(gsub("^f","frequency",cleanVars))
names(featureData)<-cleanVars

# Load Activity data
testAct<-read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,colClasses="numeric",col.names="activity.id")
trainAct<-read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,colClasses="numeric",col.names="activity.id")
activityData<-rbind(testAct,trainAct)

# Add descriptive activity names i.e. use activity labels instead of id
act<-merge(activityLabels,activityData,by.x="activityid",by.y="activity.id",all=TRUE)
finalAct<-act[,2]
#subact<-cbind(subject,activityData)
subact<-cbind(subject,finalAct)
names(subact)<-c("subjectid","activitylabels")

# Create single dataset from subject,activity and feature data
allMergedData<-cbind(featureData,subjectid=subact$subjectid,activitylabel=subact$activitylabel)
write.table(allMergedData,"Dataset1.txt",row.names=F)

# Create a tidy dataset from wide to long format data using melt() from reshape2 package and keeping the activity ID as factor
subjectActivity<-cbind(subject,activityData)
names(subjectActivity)<-c("subjectid","activitylabels")
allMergedDataset2<-cbind(featureData,subjectid=subjectActivity$subjectid,activitylabel=subjectActivity$activitylabel)

tidyData<-melt(allMergedDataset2,id.vars=c("subjectid","activitylabel"))

# Independent tidy dataset with the average of each variable for each activity and each subject.
aggregateMean<-dcast(tidyData,subjectid+activitylabel~variable,fun.aggregate=mean)

# Write out the resultant dataset
write.table(aggregateMean,"tidyDataSet.txt",row.names=F)











