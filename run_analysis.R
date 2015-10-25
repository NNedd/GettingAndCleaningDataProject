trainSet <- read.table("train/X_train.txt")
trainLabels <- read.table("train/Y_train.txt", colClasses = "character")
trainSubjectLabels <- read.table("train/subject_train.txt")

testSet <- read.table("test/X_test.txt")
testLabels <- read.table("test/Y_test.txt", colClasses = "character")
testSubjectLabels <- read.table("test/subject_test.txt")
allSet <- bind_rows(trainSet, testSet)
allLabels <- bind_rows(trainLabels, testLabels)
allSubjects <- bind_rows(trainSubjectLabels, testSubjectLabels)

allData <- bind_cols(allLabels, allSubjects, allSet)

columnLabels <- read.table("features.txt", stringsAsFactors = FALSE)

colnames(allData)[1] <- "Activity"
colnames(allData)[2] <- "Subject"

colnames(allData)[3:563] <- columnLabels$V2

#Part 2

meanLabels <- select_vars(names(allData), contains("mean()"))
stdLabels <- select_vars(names(allData), contains("std()"))
params <- c("Activity","Subject", names(meanLabels), names(stdLabels))

i <- match(params, names(allData))
newData <- allData[,i]

#Part 3

activityLabels <- read.table("activity_labels.txt", colClasses = "character")

for (k in 1:10299){
  temp <-newData[[k,1]]
  temp2 <- filter(activityLabels, V1 == temp)
  newData[[k,1]] <- temp2[[1,2]]
}

#Part 4

names(newData) <- sub("Acc","Acceleration",names(newData))
names(newData) <- sub("Gyro","Gyroscope",names(newData))
names(newData) <- gsub("-","",names(newData))
names(newData) <- sub("\\()","",names(newData))
names(newData) <- tolower(names(newData))

for (k in 1:10299){
  toString(newData[k,1])
}
#Part 5

groupedData <- group_by(newData, activity, subject)
tidyData <- summarise_each(groupedData, funs(mean))

#Writing the text file

write.table(tidyData, "tidyDataAssignment.txt", row.names=FALSE)


