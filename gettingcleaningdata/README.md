# "Getting and Cleaning Data" week 4 course project

## Steps to execute run_analysis.R script
`R --no-save --slave -f run_analysis.R`

## Output
File `groupedAvgDataStep5.txt` containg tidy data set with the average of each variable for each activity and each subject 

## Assumptions
Original data is unziped and kept in following directory structure
    UCI HAR Dataset/:
        activity_labels.txt
        features_info.txt
        features.txt
        README.txt
        test/
        train/
    
    UCI HAR Dataset/test:
        subject_test.txt  
        X_test.txt 
        y_test.txt
    
    UCI HAR Dataset/train:
        subject_train.txt
        X_train.txt
        y_train.txt

## The run_analysis.R script performs following tasks 
1. Read test data
2. Replace activity label in test data with activity names
3. Column-wise append subject ID and activity label
4. Read training data
5. Replace activity label in training data with activity names
6. Column-wise append subject ID and activity label
7. Row-wise merge test and training data
8. Read feature names from feature file and rename merged data's columns with those names.
9. Extract mean and standard deviation related columns from merged data.
10. Group the data by subject id and activity name.
11. Calculate average of all the columns to find mean of each group's measurements.
