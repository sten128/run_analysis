library(dplyr)

#read into data frames activity labels and names of variables and does some 
#modification on names (remove upper case letters and substitute some special characters)
activitylabels<-read.table("/home/sten/UCI HAR Dataset/activity_labels.txt")
activitylabels$V2<-tolower(activitylabels$V2)
activitylabels$V2<-gsub("_", ".", activitylabels$V2 )

namesvar<-read.table("/home/sten/UCI HAR Dataset/features.txt")


namesvar$V2<-gsub("\\()", "", namesvar$V2)
namesvar$V2<-gsub("-", ".", namesvar$V2)
namesvar$V2<-tolower(namesvar$V2)
namesvar<-namesvar$V2


#Tidying train data

xtrain<-read.table("/home/sten/UCI HAR Dataset/train/X_train.txt")

ytrain<-read.table("/home/sten/UCI HAR Dataset/train/y_train.txt")

subjecttrain<-read.table("/home/sten/UCI HAR Dataset/train/subject_train.txt")


names(ytrain)<-"activity.name"

names(subjecttrain)<-"subject.id"





names(xtrain)<-namesvar



xtrain<-cbind(ytrain, xtrain)
xtrain<-cbind(subjecttrain, xtrain)




 
for (i in 1:length(xtrain$activity.name)) {
        value<- as.numeric(xtrain[ i,2])
        xtrain[ i,2]<-as.character(activitylabels$V2[value])} 


#Now do the same for test data 

xtest<-read.table("/home/sten/UCI HAR Dataset/test/X_test.txt")

ytest<-read.table("/home/sten/UCI HAR Dataset/test/y_test.txt")

subjecttest<-read.table("/home/sten/UCI HAR Dataset/test/subject_test.txt")


names(ytest)<-"activity.name"

names(subjecttest)<-"subject.id"





names(xtest)<-namesvar



xtest<-cbind(ytest, xtest)
xtest<-cbind(subjecttest, xtest)


for (i in 1:length(xtest$activity.name)) {
        value<- as.numeric(xtest[ i,2])
        xtest[ i,2]<-as.character(activitylabels$V2[value])} 


#create merged data set from train and test data sets as required in step 1
merged<-rbind(xtrain, xtest)



#create data sets with only the measurements on the mean and standard deviation
#for each measurement, as required in step 2 of assignment
index<-grep("mean|std", colnames(merged))
mean.std.df<-merged[,index]
mean.std.df<-merged[,index]


#create data set called "average" with mean of all the variables and arranges 
#it by subject id and activity name

average<-aggregate(merged[,3:563], list(subject.id = merged$subject.id, activity.name = merged$activity.name), mean)
average<-arrange(average, subject.id, activity.name)


