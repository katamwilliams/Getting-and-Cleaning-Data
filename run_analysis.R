#### Download and Unzip Data ####

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile<-"projectdata.zip"

download.file(url,destfile, method="curl")
unzip(zipfile="projectdata.zip",exdir = as.character(getwd()))

#### Load Data into R ####

## Load test and Train data ##

testactivity<- read.table("UCI HAR Dataset/test/Y_test.txt" , header = FALSE)
trainactivity<- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)

## Load subject data from test and train ##

testsubject<- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainsubject<- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

## Load features data from test and train

testfeatures<- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
trainfeatures<- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)

#### Merge activity, subject, and features from test and train ####

activity<- rbind(trainactivity,testactivity)
subject<- rbind(trainsubject,testsubject)
features<- rbind(trainfeatures,testfeatures)

#### Change factor levels to match activity labels ####

labels<- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
activity$V1<- factor(activity$V1, levels= as.integer(labels$V1), labels=labels$V2)

#### Name activity and subject columns ####

names(activity)<- c("activity")
names(subject)<- c("subject")

#### Name feature column using text file ####

featurestxt <- read.table("UCI HAR Dataset/features.txt", head=FALSE)
names(features)<- featurestxt$V2

#### Subset for colmuns with mean and stdev ####

meanstdev<-c(as.character(featurestxt$V2[grep("mean\\(\\)|std\\(\\)", featurestxt$V2)]))
subdata<-subset(features,select=meanstdev)

#### Combine data sets using activity names and labels ####

subjectactivity <- cbind(subject, activity)
finaldata <- cbind(subdata, subjectactivity)

#### Fix time and frequency variables ####

names(finaldata)<-gsub("^t", "time", names(finaldata))
names(finaldata)<-gsub("^f", "frequency", names(finaldata))

#### New data frame with subject and activity means ####

cleandata <- aggregate(finaldata, by = list(finaldata$subject, finaldata$activity), FUN = mean)
colnames(cleandata)[1] <- "Subject"
names(cleandata)[2] <- "Activity"

#### remove avg and stdev for non-agg subject and activity columns
cleandata <- cleandata[1:68]

#### writes clean and tidy final data set as a text file ####

write.table(cleandata, file = "cleandata.txt", row.name = FALSE)










