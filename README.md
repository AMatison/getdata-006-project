getdata-006-project
===================

Repository for the Getting and Cleaning Data course Project

## run_analysis.R
This script performs all of the functions to:

* read in the relevant files from the data files in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (it won't download or unzip this file)
* merge the training and test sets into a single data set
* Subsets the merged dataset only to the feature variables for means and standard deviations (i.e. named *-mean() and *-std()) 
* calculates a mean value for each feature variable aggregated by the subject (numbered 1 to 30) and activity type
* writes out the data as a text file in a tabular format (separator = " ")

### Instructions

* unzip the data file
* run the script in the directory ~/UCI HAR Dataset
* script will output a file named "./tidied_dataset.txt"

