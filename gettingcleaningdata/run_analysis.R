#
# "Getting and cleaning data" course week4 project assignment
# The goal of the assignment is to tidy data provided at 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# and then process that data to group it by subject and activity name.
# The final data should contain average of all measurements per subject per 
# activity
#

#
# Load libraries. 
# The library will need to be installed if not already installed
# Run install.packages('<package name>') in RStudio to install the library.
#
suppressMessages(library(plyr))
suppressMessages(library(dplyr))

# Find out operating system specific file name seperator.
fileSep <- .Platform$file.sep

# Assume "UCI HAR Dataset" is in current working directory. If not, then modify
# following dataDir variable appropriately.
dataDir <- paste0(getwd(),fileSep,"UCI HAR Dataset")
testDataDir <- paste0(dataDir, fileSep, "test", fileSep)
trainDataDir <- paste0(dataDir, fileSep, "train", fileSep)

# Read mapping of activity label and activity name
activityLabelFile <- paste0(dataDir, fileSep, "activity_labels.txt")
activityLabelData <- read.delim(activityLabelFile,
                                header = FALSE,
                                sep = "",
                                col.names = c("label", "activityName"), 
                                stringsAsFactor = FALSE)
#
# Process test data
#
testSubjectFile <- paste0(testDataDir, "subject_test.txt")
testDataFile <- paste0(testDataDir, "X_test.txt")
testLabelFile <- paste0(testDataDir, "y_test.txt")

testSubjectData <- read.delim(testSubjectFile,
                              header = FALSE,
                              sep = "",
                              stringsAsFactor = FALSE)
testData <- read.delim(testDataFile,
                       header = FALSE,
                       sep = "",
                       stringsAsFactor = FALSE)
testLabelData <- read.delim(testLabelFile, 
                            header = FALSE,
                            sep = "",
                            col.names = c("label"),
                            stringsAsFactor = FALSE)

#
# STEP 3 of assignment: Uses descriptive activity names to name the activities 
#                       in the data set
# 

# Change the Label data to activity name. The mapping can be found in 
# activity_labels.txt file which is loaded in activityLabelData
testLabelData$label <- mapvalues(testLabelData$label,
                                 from = activityLabelData$label,
                                 to = activityLabelData$activityName)

# Column-wise merge subject, label and measured data.
testMergedData <- cbind(testSubjectData, testLabelData, testData)

#
# Process train data
# 
trainSubjectFile <- paste0(trainDataDir, "subject_train.txt")
trainDataFile <- paste0(trainDataDir, "X_train.txt")
trainLabelFile <- paste0(trainDataDir, "y_train.txt")

trainSubjectData <- read.delim(trainSubjectFile,
                               header = FALSE,
                               sep = "",
                               stringsAsFactor = FALSE)
trainData <- read.delim(trainDataFile,
                        header = FALSE,
                        sep = "",
                        stringsAsFactor = FALSE)
trainLabelData <- read.delim(trainLabelFile, 
                             header = FALSE,
                             sep = "",
                             col.names = c("label"),
                             stringsAsFactor = FALSE)

#
# STEP 3 of assignment: Uses descriptive activity names to name the activities 
#                       in the data set
# 

# Change the Label data to activity name. The mapping can be found in 
# activity_labels.txt file which is loaded in activityLabelData
trainLabelData$label <- mapvalues(trainLabelData$label,
                                 from = activityLabelData$label,
                                 to = activityLabelData$activityName)

# Column-wise merge subject, label and measured data.
trainMergedData <- cbind(trainSubjectData, trainLabelData, trainData)

#
# STEP 1 of assignment: Merges the training and the test sets to create one 
#                       data set.
#

# Row-wise merge test and train data. Then extract relevant columns
combinedData <- rbind(testMergedData, trainMergedData)

#
# STEP 4 of assignment: Appropriately labels the data set with descriptive 
#                       variable names.
# 

# Read names of the data points from features.txt file. Then label columns in
# data set with those names.
featuresFile <- paste0(dataDir, fileSep, "features.txt")
featuresData <- read.delim(featuresFile,
                           header = FALSE,
                           sep = "", 
                           col.names = c("number", "name"),
                           stringsAsFactor = FALSE)
featureNames <- featuresData$name

names(combinedData) <- c("SubjectID", "activityName", featureNames)

# 
# STEP 2 of assignment: Extracts only the measurements on the mean and standard 
#                       deviation for each measurement.
#

# The only columns of interest are the ones having "*mean()*" and "*std()* in
# their names. So filter data set based on that criteria. 
# Keep SubjectID and activityName columns as well.
requiredColumns <- grep("^SubjectID|^activityName|*mean\\(\\)*|*std\\(\\)*",
                        names(combinedData))
meanStdData <- combinedData[,requiredColumns]

#
# STEP 5 of assignment: From the data set in step 4, creates a second, 
#                       independent tidy data set with the average of each 
#                       variable for each activity and each subject.
#

# The data needs to be grouped by SubjectID and activityName. Then a mean is 
# to be taken on all other columns.
grpSubActivityData <- group_by(meanStdData, SubjectID, activityName)
groupedAvgData <- summarise_each(grpSubActivityData, funs(mean))

# Modify column name to prefix with "Average" so it is clear that the data 
# values are average values.
currentNames <- names(groupedAvgData)
modifiedNames <- c("SubjectID",
                   "activityName", 
                   paste("Average", 
                         grep("^t|^f", currentNames, value = TRUE)))
names(groupedAvgData) <- modifiedNames
write.table(groupedAvgData, "groupedAvgDataStep5.txt", row.names=FALSE)
