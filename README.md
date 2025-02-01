# Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository contains the R script and the data files to perform the
analysis outlined in the Getting and Cleaning Data Coursera course
project submission requirements. The purpose of this project is to
demonstrate the ability to collect, work with and clean a data set.

## Files in the repository

-   **`run_analysis.R`**\`: the R script that performs the required data
    manipulations. The data for the project can be downloaded from here:
    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

In order to run the script, save the zip file to your working directory.

The script performs the following transformations on the original data
files:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

-   **`tidy_data.txt`**\`: this file contains the tidy data set created
    in step 5.

-   **`code_book.md`**\`: this file contains the details of the data,
    the variables, the analysis and the transformations performed

## About the data

The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone, and it can be
downloaded from the following link:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
