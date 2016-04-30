## Download and unzip the dataset:
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Ds.zip",method="curl")
unzip(zipfile="./data/Ds.zip",exdir="./data")

# Load activity subject and features data
dataActivityTest  <- fread("data/UCI HAR Dataset/test/Y_test.txt")
dataActivityTrain <- fread("data/UCI HAR Dataset/train/Y_train.txt")
dataSubjectTrain <- fread("data/UCI HAR Dataset/test/subject_test.txt")
dataSubjectTest  <- fread("data/UCI HAR Dataset/train/subject_train.txt")
dataFeaturesNames <- fread("data/UCI HAR Dataset/features.txt")
dataFeaturesTest  <- fread("data/UCI HAR Dataset/test/X_test.txt",col.names = dataFeaturesNames$V2)
dataFeaturesTrain <- fread("data/UCI HAR Dataset/train/X_train.txt",col.names = dataFeaturesNames$V2)

# Merge all data into one table
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

#Extracts only the measurements on the mean and standard deviation for each measurement.
FeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
use<-as.character(FeaturesNames)
selectedNames<-c(use, "subject", "activity" )
Data1<-subset(Data,select=selectedNames)

#Uses descriptive activity names to name the activities in the data set
dataActivityLabels  <- fread("data/UCI HAR Dataset/activity_labels.txt")
for (i in 1:6){
  Data$activity[Data$activity==i]<-dataActivityLabels$V2[i]
  }

#Appropriately labels the data set with descriptive variable names.
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
names(Data)<-gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("angle", "Angle", names(Data))
names(Data)<-gsub("gravity", "Gravity", names(Data))
names(Data)<-gsub("activity", "Activity", names(Data))
names(Data)<-gsub("subject", "Subject", names(Data))

#From the data set above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#name it tidydata.txt
Data2<-aggregate(. ~subject + activity, Data1, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)

