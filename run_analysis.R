# load all required libraries. if not installed, install them first
library(reshape2)
library(dplyr)

# creating directory, downloading and unzipping files
if(!file.exists("./gettingcleaningdata")){dir.create("./gettingcleaningdata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./gettingcleaningdata/projectzip.zip", method = "libcurl")
unzip(zipfile = "./gettingcleaningdata/projectzip.zip", exdir = "./gettingcleaningdata")

#reading train datasets
x_train <- read.table("./gettingcleaningdata/UCI HAR Dataset/train/X_train.txt") # read train dataset
y_train <- read.table("./gettingcleaningdata/UCI HAR Dataset/train/y_train.txt") # read train activity identifiers
subject_train <- read.table("./gettingcleaningdata/UCI HAR Dataset/train/subject_train.txt") # read subject identifiers

# reading test datasets
x_test <- read.table("./gettingcleaningdata/UCI HAR Dataset/test/X_test.txt") # read test dataset
y_test <- read.table("./gettingcleaningdata/UCI HAR Dataset/test/y_test.txt") # read test activity identifiers
subject_test <- read.table("./gettingcleaningdata/UCI HAR Dataset/test/subject_test.txt") # read subject identifiers

#read features file (x file column headers list)
features <- read.table("./gettingcleaningdata/UCI HAR Dataset/features.txt")

#assigning column names
colnames(x_test) <- features$V2
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"
colnames(x_train) <- features$V2
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

# bind train and test datasets with activityID and subjectID
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)

#1. merge the train and test dataset to create one data set
all <- rbind(train, test)

#2. Extract only the measurements on the mean and standard deviation for each measurement
mean_std_data <- all[grepl("subjectID|activityID|mean\\(\\)|std\\(\\)", colnames(all))]

#3. Use descriptive activity names to name the activities in the data set
activity <- read.table("./gettingcleaningdata/UCI HAR Dataset/activity_labels.txt")
colnames(activity) <- c("activityID", "activityDescription")
mean_std_data <- merge(x = mean_std_data, y = activity, by = "activityID")

#4. Appropriately label the data set with descriptive variable names
colnames(mean_std_data) <- gsub("^t", "time", colnames(mean_std_data))
colnames(mean_std_data) <- gsub("^f", "frequency", colnames(mean_std_data))
colnames(mean_std_data) <- gsub("Acc", "Accelerometer", colnames(mean_std_data))
colnames(mean_std_data) <- gsub("Gyro", "Gyroscope", colnames(mean_std_data))
colnames(mean_std_data) <- gsub("Mag", "Magnitude", colnames(mean_std_data))
colnames(mean_std_data) <- gsub("-", "_", colnames(mean_std_data))
colnames(mean_std_data) <- gsub("\\(\\)", "", colnames(mean_std_data))

#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject

independent_tidy_data <- melt(mean_std_data, id = c("subjectID", "activityID", "activityDescription"))
independent_tidy_data <- dcast(independent_tidy_data, subjectID + activityID + activityDescription ~ variable, mean )

# if melt and decast not working, use below
#independent_tidy_data <- mean_std_data %>% group_by(subjectID, activityID, activityDescription) %>% dplyr::summarise(across(everything(), mean))

# write the tidy dataset to txt file
write.table(independent_tidy_data, file = "tidyDataSet.txt", row.name = FALSE)

