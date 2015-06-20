setwd("~/My R Files/Coursera/3 - Getting and Cleaning Data")

# Step 1: Merge training and test data sets

data.train <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
data.test <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
data.merged <- rbind(data.train, data.test)

label.train <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
label.test <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt") 
label.merged <- rbind(label.train, label.test)

subject.train <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
subject.merged <- rbind(subject.train, subject.test)
names(subject.merged) <- "subject"

# Step 2: Extract the mean and SD 

data.features <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
data.meansd <- grep("mean\\(\\)|std\\(\\)", data.features[, 2])
data.final <- data.merged[, data.meansd]

names(data.final) <- gsub("\\(\\)", "", data.features[data.meansd, 2])
names(data.final) <- gsub("-", "", names(data.final))
names(data.final) <- tolower(names(data.final))

# Step 3: Give the activities descriptive names

label.activity <- read.table(".//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
label.activity[, 2] <- gsub("_", " ", label.activity[, 2])
label.activity[, 2] <- tolower(label.activity[, 2])
label.activity.merged <- label.activity[label.merged[, 1], 2]
label.merged[, 1] <- label.activity.merged
names(label.merged) <- "activity"

# Step 4: Label the data set with the descriptive activity names

data.clean <- cbind(subject.merged, label.merged, data.final)

# Step 5. Create tidy data with the avg for each variable 
# for each activity and each subject
library(reshape2)
data.melted <- melt(data.clean, id=c("subject","activity"))
data.tidy <- dcast(data.melted, subject+activity ~ variable, mean)

write.table(data.tidy, "tidydata.txt",row.name=FALSE)