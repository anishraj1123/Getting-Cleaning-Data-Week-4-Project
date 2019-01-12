### Tidy data set description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


The variables in the tidy data contains 180 rows and 80 columns. Each row has averaged variables for each subject and each activity.
Only all the variables estimated from mean and standard deviation in the tidy set were kept.
     
     1.mean(): Mean value
     
     2.std(): Standard deviation

The data were averaged based on subject and activity group.
Subject column is numbered sequentially from 1 to 30. Activity column has 6 types as listed below.

     1.WALKING
     
     2.WALKING_UPSTAIRS
     
     3.WALKING_DOWNSTAIRS
     
     4.SITTING
     
     5.STANDING
     
     6.LAYING

The tidy data contains 6 rows (averaged based on activity) and 80 columns (78 variables and activity labels) for each subjectId and thus it creates 180 rows (6*30).

     1.	"x"
     2.	"activityId"
     3.	"subjectId"
     4.	"tBodyAcc-mean()-X"
     5.	"tBodyAcc-mean()-Y"
     6.	"tBodyAcc-mean()-Z"
     7.	"tBodyAcc-std()-X"
     8.	"tBodyAcc-std()-Y"
     9.	"tBodyAcc-std()-Z"
     10.	"tGravityAcc-mean()-X"
     11.	"tGravityAcc-mean()-Y"
     12.	"tGravityAcc-mean()-Z"
     13.	"tGravityAcc-std()-X"
     14.	"tGravityAcc-std()-Y"
     15.	"tGravityAcc-std()-Z"
     16.	"tBodyAccJerk-mean()-X"
     17.	"tBodyAccJerk-mean()-Y"
     18.	"tBodyAccJerk-mean()-Z"
     19.	"tBodyAccJerk-std()-X"
     20.	"tBodyAccJerk-std()-Y"
     21.	"tBodyAccJerk-std()-Z"
     22.	"tBodyGyro-mean()-X"
     23.	"tBodyGyro-mean()-Y"
     24.	"tBodyGyro-mean()-Z"
     25.	"tBodyGyro-std()-X"
     26.	"tBodyGyro-std()-Y"
     27.	"tBodyGyro-std()-Z"
     28.	"tBodyGyroJerk-mean()-X"
     29.	"tBodyGyroJerk-mean()-Y"
     30.	"tBodyGyroJerk-mean()-Z"
     31.	"tBodyGyroJerk-std()-X"
     32.	"tBodyGyroJerk-std()-Y"
     33.	"tBodyGyroJerk-std()-Z"
     34.	"tBodyAccMag-mean()"
     35.	"tBodyAccMag-std()"
     36.	"tGravityAccMag-mean()"
     37.	"tGravityAccMag-std()"
     38.	"tBodyAccJerkMag-mean()"
     39.	"tBodyAccJerkMag-std()"
     40.	"tBodyGyroMag-mean()"
     41.	"tBodyGyroMag-std()"
     42.	"tBodyGyroJerkMag-mean()"
     43.	"tBodyGyroJerkMag-std()"
     44.	"fBodyAcc-mean()-X"
     45.	"fBodyAcc-mean()-Y"
     46.	"fBodyAcc-mean()-Z"
     47.	"fBodyAcc-std()-X"
     48.	"fBodyAcc-std()-Y"
     49.	"fBodyAcc-std()-Z"
     50.	"fBodyAcc-meanFreq()-X"
     51.	"fBodyAcc-meanFreq()-Y"
     52.	"fBodyAcc-meanFreq()-Z"
     53.	"fBodyAccJerk-mean()-X"
     54.	"fBodyAccJerk-mean()-Y"
     55.	"fBodyAccJerk-mean()-Z"
     56.	"fBodyAccJerk-std()-X"
     57.	"fBodyAccJerk-std()-Y"
     58.	"fBodyAccJerk-std()-Z"
     59.	"fBodyAccJerk-meanFreq()-X"
     60.	"fBodyAccJerk-meanFreq()-Y"
     61.	"fBodyAccJerk-meanFreq()-Z"
     62.	"fBodyGyro-mean()-X"
     63.	"fBodyGyro-mean()-Y"
     64.	"fBodyGyro-mean()-Z"
     65.	"fBodyGyro-std()-X"
     66.	"fBodyGyro-std()-Y"
     67.	"fBodyGyro-std()-Z"
     68.	"fBodyGyro-meanFreq()-X"
     69.	"fBodyGyro-meanFreq()-Y"
     70.	"fBodyGyro-meanFreq()-Z"
     71.	"fBodyAccMag-mean()"
     72.	"fBodyAccMag-std()"
     73.	"fBodyAccMag-meanFreq()"
     74.	"fBodyBodyAccJerkMag-mean()"
     75.	"fBodyBodyAccJerkMag-std()"
     76.	"fBodyBodyAccJerkMag-meanFreq()"
     77.	"fBodyBodyGyroMag-mean()"
     78.	"fBodyBodyGyroMag-std()"
     79.	"fBodyBodyGyroMag-meanFreq()"
     80.	"fBodyBodyGyroJerkMag-mean()"
     81.	"fBodyBodyGyroJerkMag-std()"
     82.	"fBodyBodyGyroJerkMag-meanFreq()"


### Variable units
Activity variable is factor type. Subject variable is integer type. All the other variables are numeric type.


### Functions used
     1.rbind,cbind and merge: To merge training an test data
     
     2.Aggregate: to apply mean on the selected observations
     
     3.grepl: To find out the columns with mean and standard deviation entires
