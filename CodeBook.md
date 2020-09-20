# Code Book
Coursera Data Science Specialization Course  
Getting and Cleaning Data  
Course Project  

## Data
Source data is from the Human Activity Recognition Using Smartphones Dataset project
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Processing

Data is processed by running the following R command:
`R -f run.R`

This will download the dataset from the URL above, extract the datasets, import, merge and melt the data to the `tidy_results.txt` file

## Variables

| Name             | Use                                      | 
|------------------|------------------------------------------|
| x_train          | /UCI HAR Dataset/train/X_train.txt       |
| y_train          | /UCI HAR Dataset/train/Y_train.txt       |
| s_train          | /UCI HAR Dataset/train/subject_train.txt |
| x_test           | /UCI HAR Dataset/test/X_test.txt         |
| y_test           | /UCI HAR Dataset/test/Y_test.txt         |
| s_test           | /UCI HAR Dataset/test/subject_test.txt   |
| x_data           | Merged datasets of train and test        |
| y_data           | Merged datasets of train and test        |
| s_data           | Merged datasets of train and test        |
| feature          | /UCI HAR Dataset/features.txt            |
| a_label          | /UCI HAR Dataset/activity_labels.txt     |
| selectedCols     | Grep values for mean and std deviation   |
| selectedColNames | Extracted names for mean and std         |
| allData          | x, y, and z datasets merged into one     |
| meltedData       | Melted datasets based on sub, activity   |
| tidyData         | Casted dataset based on subject and activity with mean values |
