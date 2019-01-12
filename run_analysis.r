

#Set your working directory
setwd("C:/Users/samsung/Desktop/Coursera/Module 3/Week4")

#Download UCI data files from the web, unzip them
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FileName <- "Module3_Week4_Quiz_data.zip"


if (!file.exists(FileName)){
    download.file(fileURL, destfile = FileName, mode='wb')
}


if (!file.exists("./UCI_HAR_Dataset")){
    unzip(FileName)
}

#Start reading files

## read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


## read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## read data description
variable_names <- read.table("./UCI HAR Dataset/features.txt")

## read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")


#Create Sanity and Column Values to the Train Data
colnames(X_train) <- variable_names[,2]
colnames(Y_train)  <- "activityId"
colnames(Sub_train) <- "subjectId"

#Create Sanity and column values to the test data
colnames(X_test) <- variable_names[,2]
colnames(Y_test) <- "activityId"
colnames(Sub_test) <- "subjectId"

#Create sanity check for the activity labels value
colnames(activity_labels) <- c('activityId','activityType')


# 1. Merges the training and the test sets to create one data set.
mrg_train = cbind(Y_train, Sub_train, X_train)
mrg_test = cbind(Y_test, Sub_test, X_test)

##Create the main data table merging both table tables- rbind makes mrg_test to add just below mrg_train as rows 
mrg_train_test <- rbind(mrg_train, mrg_test) 
colNames <- colnames(mrg_train_test)



#2.Extracts only the measurements on the mean and standard deviation for each measurement

##Need to get a subset of all the mean and standards and the correspondongin activityID and subjectID 
mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

##This would extract values of X_train and Y_train wherever the column name has "mean" or "std". 
##Also the corresponding activityID and subjectID will be extracted as all the column numbers will be
##marked TRUE in the "mean_and_std" list For ex in row 1 of "mean_and_std" list has 1st,2nd,3rd and 4th rows as TRUE
##Thus column 1,2,3 and 4 with all rows will be extracyed in the subset
setForMeanAndStd <- mrg_train_test[ , mean_and_std == TRUE]


#3.Uses descriptive activity names to name the activities in the data set
##creating subset by adding activit labels like WALKING_UPSTAIRS 
setForMeanAndStd$activityId <-activity_labels[setForMeanAndStd$activityId,2]

#4.Appropriately labels the data set with descriptive variable names.
columns = colnames(setForMeanAndStd)

##changing columnnames in the columns list for setWithActivityNames subset
for(i in 1:length(columns)){
    ##columns[i] = gsub("activityId","activityName",columns[i]) ##changing the first column header
    columns[i] = gsub("\\()","",columns[i])
    columns[i] <- gsub("-std$","StdDev",columns[i])
    columns[i] <- gsub("-mean","Mean",columns[i])
    columns[i] <- gsub("^(t)","time",columns[i])
    columns[i] <- gsub("^(f)","freq",columns[i])
    columns[i] <- gsub("([Gg]ravity)","Gravity",columns[i])
    columns[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",columns[i])
    columns[i] <- gsub("[Gg]yro","Gyro",columns[i])
    columns[i] <- gsub("AccMag","AccMagnitude",columns[i])
    columns[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",columns[i])
    columns[i] <- gsub("JerkMag","JerkMagnitude",columns[i])
    columns[i] <- gsub("GyroMag","GyroMagnitude",columns[i])
    
}
##replacing the column names with the corrected ones from above
colnames(setForMeanAndStd)=columns

#5From the data set in step 4, creates a second, independent tidy data set with the 
##average of each variable for each activity and each subject
##data is setWithActivityNames[,column names(except activityName and subjectID)]
##data in all other columns of "setWithActivityNames" is aggregated to find mean
tidyData <- aggregate(setForMeanAndStd[,names(setForMeanAndStd) 
                                           != c('activityId','subjectId')],by=list
                      (activityId=setForMeanAndStd$activityId,
                          subjectId=setForMeanAndStd$subjectId),mean,na.action=na.omit)

##ordering tidyData first on subjectId and then activityId
tidyData <- tidyData1[order(tidyData$subjectId, tidyData$activityId),]

##Removing NA values
tidyData <- tidyData[,names(tidyData) != 'activityType.x']
tidyData <- tidyData[,names(tidyData) != 'activityType.y']

write.table(tidyData, "TidyDataSet.txt", row.name=FALSE)
