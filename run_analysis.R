# Download the data
if(!file.exists("./data")){dir.create("./data")}
durl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(durl,destfile="./Dataset.zip",method="curl")
# Unzip the data file
unzip(zipfile="./Dataset.zip",exdir="./")
# Get the list of the files from folder
ls <- file.path("./" , "UCI HAR Dataset")
files<-list.files(ls, recursive=TRUE)
files
# Read data from the files into the variables
# Activity files
DAFTest  <- read.table(file.path(ls, "test" , "Y_test.txt" ),header = FALSE)
DAFTrain <- read.table(file.path(ls, "train", "Y_train.txt"),header = FALSE)
# Subject files
DSFTest  <- read.table(file.path(ls, "test" , "subject_test.txt" ),header = FALSE)
DSFTrain <- read.table(file.path(ls, "train", "subject_train.txt"),header = FALSE)
# Features files
DFFTest  <- read.table(file.path(ls, "test" , "x_test.txt" ),header = FALSE)
DFFTrain <- read.table(file.path(ls, "train", "x_train.txt"),header = FALSE)
# View Structure
str(DAFTest)
str(DAFTrain)
str(DSFTest)
str(DSFTrain)
str(DFFTest)
str(DFFTrain)
# 1 Merging the training and test
#   Concatenate data tables
DAFBind <- rbind(DAFTrain, DAFTest)
DSFBind <- rbind(DSFTrain, DSFTest)
DFFBind <- rbind(DFFTrain, DFFTest)
#Change the names to variables
names(DAFBind)<-c("Activity")
names(DSFBind)<- c("Subject")
DFFNames <- read.table(file.path(ls, "features.txt"),head=FALSE)
names(DFFBind)<- DFFNames$V2
#Merge
DMerge <- cbind(DSFBind, DAFBind)
Data <- cbind(DFFBind, DMerge)
# 2 Extracts only the measurements on the mean and standard deviation for each measurement
#   Subset Name of Features by measurements on the mean and standard deviation
subDFFNames<-DFFNames$V2[grep("mean\\(\\)|std\\(\\)", DFFNames$V2)]
#   Subset the data frame Data by seleted names of Features
SelectedNames<-c(as.character(subDFFNames), "Subject", "Activity" )
Data<-subset(Data,select=SelectedNames)
str(Data)
# 3 Use descriptive activity names to name the activities in the data set
ActivityLabels <- read.table(file.path(ls, "activity_labels.txt"),header = FALSE)
DAFTest$V1 <- factor(DAFTest$V1,levels=ActivityLabels$V1,labels=ActivityLabels$V2)
DAFTrain$V1 <- factor(DAFTrain$V1,levels=ActivityLabels$V1,labels=ActivityLabels$V2)
head(Data$Activity,30)
# 4. Appropriately label the data set with descriptive activity names
colnames(DFFTest)<-DFFNames$V2
colnames(DFFTrain)<-DFFNames$V2
colnames(DAFTest)<-c("Activity")
colnames(DAFTrain)<-c("Activity")
colnames(DSFTest)<-c("Subject")
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
DTData <- data.table(Data)
TidyData <-DTData[,lapply(.SD,mean),by="Activity,Subject"]
head(TidyData)
write.table(TidyData,file="TidyData.txt",sep=",",row.names = FALSE)

