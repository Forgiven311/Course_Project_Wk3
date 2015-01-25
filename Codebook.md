Introduction

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


Description of the dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

For each record it is provided:
======================================
-	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-	Triaxial Angular velocity from the gyroscope. 
-	A 561-feature vector with time and frequency domain variables. 
-	Its activity label. 
-	An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

-	'README.txt'
-	'features_info.txt': Shows information about the variables used on the feature vector.
-	'features.txt': List of all features.
-	'activity_labels.txt': Links the class labels with their activity name.
-	'train/X_train.txt': Training set.
-	'train/y_train.txt': Training labels.
-	'test/X_test.txt': Test set.
-	'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
-	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

-	'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

-	'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

-	'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


The resulting variables and structural description

There are 68 variables as seen below 66 of these have the “number” datatype and the last 2 are of “integer”.

 
  Variable Name	                Data type
 # tBodyAcc-mean()-X          	Number 
 # tBodyAcc-mean()-Y          	Number 
 # tBodyAcc-mean()-Z          	Number 
 # tBodyAcc-std()-X           	Number 
 # tBodyAcc-std()-Y           	Number 
 # tBodyAcc-std()-Z           	Number 
 # tGravityAcc-mean()-X       	Number 
 # tGravityAcc-mean()-Y       	Number 
 # tGravityAcc-mean()-Z       	Number 
 # tGravityAcc-std()-X        	Number 
 # tGravityAcc-std()-Y        	Number 
 # tGravityAcc-std()-Z        	Number 
 # tBodyAccJerk-mean()-X      	Number 
 # tBodyAccJerk-mean()-Y      	Number 
 # tBodyAccJerk-mean()-Z      	Number 
 # tBodyAccJerk-std()-X       	Number 
 # tBodyAccJerk-std()-Y       	Number 
 # tBodyAccJerk-std()-Z       	Number 
 # tBodyGyro-mean()-X         	Number 
 # tBodyGyro-mean()-Y         	Number 
 # tBodyGyro-mean()-Z         	Number 
 # tBodyGyro-std()-X          	Number 
 # tBodyGyro-std()-Y          	Number 
 # tBodyGyro-std()-Z          	Number 
 # tBodyGyroJerk-mean()-X     	Number 
 # tBodyGyroJerk-mean()-Y     	Number 
 # tBodyGyroJerk-mean()-Z     	Number 
 # tBodyGyroJerk-std()-X      	Number 
 # tBodyGyroJerk-std()-Y      	Number 
 # tBodyGyroJerk-std()-Z      	Number 
 # tBodyAccMag-mean()         	Number 
 # tBodyAccMag-std()          	Number 
 # tGravityAccMag-mean()      	Number 
 # tGravityAccMag-std()       	Number 
 # tBodyAccJerkMag-mean()     	Number 
 # tBodyAccJerkMag-std()      	Number 
 # tBodyGyroMag-mean()        	Number 
 # tBodyGyroMag-std()         	Number 
 # tBodyGyroJerkMag-mean()    	Number 
 # tBodyGyroJerkMag-std()     	Number 
 # fBodyAcc-mean()-X          	Number 
 # fBodyAcc-mean()-Y          	Number 
 # fBodyAcc-mean()-Z          	Number 
 # fBodyAcc-std()-X           	Number 
 # fBodyAcc-std()-Y           	Number 
 # fBodyAcc-std()-Z           	Number 
 # fBodyAccJerk-mean()-X      	Number 
 # fBodyAccJerk-mean()-Y      	Number 
 # fBodyAccJerk-mean()-Z      	Number 
 # fBodyAccJerk-std()-X       	Number 
 # fBodyAccJerk-std()-Y       	Number 
 # fBodyAccJerk-std()-Z       	Number 
 # fBodyGyro-mean()-X         	Number 
 # fBodyGyro-mean()-Y         	Number 
 # fBodyGyro-mean()-Z         	Number 
 # fBodyGyro-std()-X          	Number 
 # fBodyGyro-std()-Y          	Number 
 # fBodyGyro-std()-Z          	Number 
 # fBodyAccMag-mean()         	Number 
 # fBodyAccMag-std()          	Number 
 # fBodyBodyAccJerkMag-mean() 	Number 
 # fBodyBodyAccJerkMag-std()  	Number 
 # fBodyBodyGyroMag-mean()    	Number 
 # fBodyBodyGyroMag-std()     	Number 
 # fBodyBodyGyroJerkMag-mean()	Number 
 # fBodyBodyGyroJerkMag-std() 	Number 
 # Subject                    	Interger
 # Activity                   	Interger
	

Steps taken to perform Transformations on the data

-	Download the data from the UCI website 
-	Reading the data into R working directory
o	Activity files
o	Subject files
o	Features file
-	View the structure of the files to enhance understanding of the bigger picture.
-	Merge the training and the test sets to create one data set.
-	Extract only the measurements on the mean and standard deviation for each measurement. 
-	Use descriptive activity names to name the activities in the data set
-	Appropriately label the data set with descriptive variable names. 
-	Create a second, independent tidy data set with the average of each variable for each activity and each subject.

