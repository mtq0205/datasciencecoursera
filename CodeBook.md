Initial Data Description
=========================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

Final Data Description
========================

Following variables are part of the final dataset -

subjectid
activitylabel
timebodyaccmeanx
timebodyaccmeany
timebodyaccmeanz
timegravityaccmeanx
timegravityaccmeany
timegravityaccmeanz
timebodyaccjerkmeanx
timebodyaccjerkmeany
timebodyaccjerkmeanz
timebodygyromeanx
timebodygyromeany
timebodygyromeanz
timebodygyrojerkmeanx
timebodygyrojerkmeany
timebodygyrojerkmeanz
timebodyaccmagmean
timegravityaccmagmean
timebodyaccjerkmagmean
timebodygyromagmean
timebodygyrojerkmagmean
frequencybodyaccmeanx
frequencybodyaccmeany
frequencybodyaccmeanz
frequencybodyaccjerkmeanx
frequencybodyaccjerkmeany
frequencybodyaccjerkmeanz
frequencybodygyromeanx
frequencybodygyromeany
frequencybodygyromeanz
frequencybodyaccmagmean
frequencybodybodyaccjerkmagmean
frequencybodybodygyromagmean
frequencybodybodygyrojerkmagmean
timebodyaccstdx
timebodyaccstdy
timebodyaccstdz
timegravityaccstdx
timegravityaccstdy
timegravityaccstdz
timebodyaccjerkstdx
timebodyaccjerkstdy
timebodyaccjerkstdz
timebodygyrostdx
timebodygyrostdy
timebodygyrostdz
timebodygyrojerkstdx
timebodygyrojerkstdy
timebodygyrojerkstdz
timebodyaccmagstd
timegravityaccmagstd
timebodyaccjerkmagstd
timebodygyromagstd
timebodygyrojerkmagstd
frequencybodyaccstdx
frequencybodyaccstdy
frequencybodyaccstdz
frequencybodyaccjerkstdx
frequencybodyaccjerkstdy
frequencybodyaccjerkstdz
frequencybodygyrostdx
frequencybodygyrostdy
frequencybodygyrostdz
frequencybodyaccmagstd
frequencybodybodyaccjerkmagstd
frequencybodybodygyromagstd
frequencybodybodygyrojerkmagstd


subjectid: Contains data for 30 subjects who were part of the experiment
Activitylabel: IDs of activities performed (as below) - 1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


Transformations applied to the initial dataset
=================================================

- Only the mean and SD variables were extracted from the initial data
- All the feature variables column names were renames to put descriptive names
- One combined dataset was created by merging the subject, activity and feature data for both test and train- 
- The wide format dataset was converted to long format
- Finally an independent tidy data set was created with the average of each variable for each activity and each subject.

