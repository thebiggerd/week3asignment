library(data.table)
library(dplyr)
#Load test and train data
testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)


#Load descriptive data
featuresColNames <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

#3 set activity names
#testY$V1 <- factor(testY$V1,levels=activities$V1,labels=activities$V2)
#trainData_act$V1 <- factor(trainData_act$V1,levels=activities$V1,labels=activities$V2)


# 1- Merge data
mergedSubject <- rbind(trainSub, testSub)
mergedAct <- rbind(testY, trainY)
#The following line is actually for number 3 to set meaninful activities in the column
mergedAct$V1 <- factor(mergedAct$V1,levels=activityLabels$V1,labels=activityLabels$V2)
mergedFeatures <- rbind(testX, trainX)

# 4 - Set colnames
colnames(mergedFeatures) <- t(featuresColNames[2])
colnames(mergedAct) <- "Activity"
colnames(mergedSubject) <- "Subject"
mergedDataSet <- cbind(mergedSubject, mergedFeatures, mergedAct)

#2  Extract mean and sd
mergedDataSet_mean <- sapply(mergedDataSet,mean,na.rm=TRUE)
mergedDataSet_sd <- sapply(mergedDataSet,sd,na.rm=TRUE)

#5 creates tidy data set 
DT <- data.table(mergedDataSet)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy.csv",sep=",",row.names = FALSE)

