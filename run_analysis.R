## Project Assignment - Coursera - getting and cleaning data
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
##
## Data to be used for the project 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##

library(dplyr)
library(data.table)


## Downloading File

if (!file.exists("data")) {
  dir.create("data")
}
setwd("./data")
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url, "zipdata.zip")

## Unzipping file
unzip("zipdata.zip")

## Reading  files into memory

subject_train    <-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subject_test     <-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
y_train          <-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
y_test           <-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
x_train          <-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
x_test           <-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
features         <-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
activity_labels  <-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

## 1.Merges the training and the test sets to create one data set

subject <-rbind(subject_train,subject_test)
y       <-rbind(y_train,y_test)
x       <-rbind(x_train,x_test)

## Combine y and activity labels
subjectactivity <- cbind(subject,y) 
names(subjectactivity)[1] <- c("SubjectId")
names(subjectactivity)[2] <- c("ActivityId")
names(activity_labels)[1] <- c("ActivityId")
names(activity_labels)[2] <- c("ActivityName")
subjectactivity <- merge(activity_labels,subjectactivity, by="ActivityId")

## free some memory
rm(subject_train,subject_test,y_train,y_test, x_train,x_test, activity_labels,y)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement
index <- c(grep("*-std*", features$V2), grep("*-mean*", features$V2) )
index <- sort(index)
selx <- x[,index]

## 3.Uses descriptive activity names to name the activities in the data set
selfeatures <- features[index,]
selfeatures[,2] <- gsub("[()]", "", selfeatures[,2])
selfeatures[,2] <- gsub("[-]", "", selfeatures[,2])


## 4.Appropriately labels the data set with descriptive variable names. 
tidydata           <- cbind(subjectactivity[3], subjectactivity[2])

names(selx)[]      <- selfeatures[,2]
tidydata           <- cbind(tidydata, selx)

## free some memory
rm(subject, features,selfeatures,selx, subjectactivity,x, Url,index)

tidydatadt <- data.table(tidydata)
write.table(tidydatadt,file="tidydata.csv",sep=",",row.names = FALSE)

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydatadt <- data.table(tidydata)

tidystat<- tidydatadt[,lapply(.SD,mean),by="SubjectId,ActivityName"]
tidystat <- arrange(tidystat, SubjectId,ActivityName)
write.table(tidystat,file="tidydatastat.txt",sep=",",row.names = FALSE)

