# Peer-Assessment---Getting-and-Cleaning-Data

##This describes how to set-up for "run_analysis.R"

* Unzip the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to the same working directory as the "run_analysis.R" script.
* Open and run the "run_analysis.R" file in RStudio.

##This describes how "run_analysis.R" works

* Data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Read X_train.txt from the train folder and store as data.train. Read X_test.txt from the test folder and store as data.test. Merge these to create data.merged.
* Read y_train.txt from the train folder and store as label.train. Read y_test.txt fomr the test folder and store as label.test. Merge these to create label.merged.
* Read subject_train.text from the train folder and store as subject.train. Read subject_test.txt from the test folder and store as subject.test. Merge these to create subject.merged and label as "subject".
* Read features.txt from the main folder and store as data.features. 
* Extract only the mean and standard deviation columns from this file and create data.final. Clean up the column names by remvoing capitalization and extra puncutation from the variable names.
* Read activity_labels.txt from the main folder and store as label.activity. Clean up column labels by removing capitalization and extra punctuations marks. Label column as "activity" and store as label.merged.
* Combine subject.merged, label.merged, and data.final to create data.clean. Write out data to "mergedtraintest.txt" file.
* Generate a tidy data set with the average of each measurement for each activity and each subject using two for-loops.
Write out data to "avgbyactivitybysubject.txt" file. 