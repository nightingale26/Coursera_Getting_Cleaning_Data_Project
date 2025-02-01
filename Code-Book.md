# Code Book

The purpose of this document is to provide the necessary informaton
about the source data, its structure, contents, and layout, including
its variables

## Source data

The source data used for this project was the Human Activity Recognition
database, which was built from the recordings of 30 subjects performing
activities of daily living (ADL) while carrying a waist-mounted
smartphone with embedded inertial sensors. The data was collected from
the accelerometers from the Samsung Galaxy S smartphone. A full
description of the experiment is available at the site where the data
was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data can be downloaded from here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### List of the original data set files included in the zip file:

-   ‘README.txt’

-   ‘features\_info.txt’: Shows information about the variables used on
    the feature vector.

-   ‘features.txt’: List of all features.

-   ‘activity\_labels.txt’: Links the class labels with their activity
    name.

-   ‘train/X\_train.txt’: Training set.

-   ‘train/y\_train.txt’: Training labels.

-   ‘test/X\_test.txt’: Test set.

-   ‘test/y\_test.txt’: Test labels.

-   ‘train/subject\_train.txt’ and test/subject\_test.txt’: Each row
    identifies the subject who performed the activity for each window
    sample. Its range is from 1 to 30.

The following files are included in the zip file however have not been
used for the current project:

-   ‘train/Inertial Signals/total\_acc\_x\_train.txt’ and ‘test/Inertial
    Signals/total\_acc\_x\_test.txt’

-   ‘train/Inertial Signals/body\_acc\_x\_train.txt’ and ‘test/Inertial
    Signals/body\_acc\_x\_test.txt’

-   ‘train/Inertial Signals/body\_gyro\_x\_train.txt’ and ‘test/Inertial
    Signals/body\_gyro\_x\_train.test’

## R script

Pre-requisite: Download the source data from the link provided and save
it to your working directory.

The “run\_analysis.R” script performs the following transformations in
line with the course assignment:

1.  **Merges the training and the test sets to create one data set**

-   reads all train and test files, as well as the file containing
    feature vector
-   assigns variable names to train and test files, then
-   merges train and test data to create one data set

2.  **Extracts only the measurements on the mean and standard deviation
    for each measurement**

-   selects only the mean and standard deviation measurements

3.  **Uses descriptive activity names to name the activities in the data
    set**

-   reads the file containing the activity labels, and
-   joins it to the dataset

4.  **Appropriately labels the data set with descriptive variable
    names**

-   modifies the measurement variable labels to be more descriptive
    instead of using abbreviations and special characters

5.  **From the data set in step 4, creates a second, independent tidy
    data set with the average of each variable for each activity and
    each subject.**

-   melts the data then decasts based on the average of each variable
    for each activity and subject, then
-   creates a txt file containing the independent tidy data set
