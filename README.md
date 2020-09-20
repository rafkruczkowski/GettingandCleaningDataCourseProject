# Getting Cleaning Data Project
Coursera Data Science Specialization Course 
Course Project

## Project Description
Project uses the accelerometers data taken from a smart phone from several people performing selected activities.
Result is to generate a tidy dataset that can be used to determine and profile activities performed by the device.

## Project Goals

### 1. Merges the training and the test sets to create one data set.
Take the x, y, and z datasets to make a new dataset

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Take the measurements of interest and place into a new dataset

### 3. Uses descriptive activity names to name the activities in the data set
Use the activity_lables, features_info files to apply the headers for the values

### 4. Appropriately labels the data set with descriptive variable names.
Apply labels by using factors for the Activity and Subjects

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Melt the remaining data to a tidy dataset based on Subject and Activity

## Project Files

├── CodeBook.md                                          # Code book for project
├── data                                                 # Extracted dataset
│   └── UCI HAR Dataset
│       ├── activity_labels.txt
│       ├── features_info.txt
│       ├── features.txt
│       ├── README.txt
│       ├── test
│       │   ├── Inertial Signals
│       │   │   ├── body_acc_x_test.txt
│       │   │   ├── body_acc_y_test.txt
│       │   │   ├── body_acc_z_test.txt
│       │   │   ├── body_gyro_x_test.txt
│       │   │   ├── body_gyro_y_test.txt
│       │   │   ├── body_gyro_z_test.txt
│       │   │   ├── total_acc_x_test.txt
│       │   │   ├── total_acc_y_test.txt
│       │   │   └── total_acc_z_test.txt
│       │   ├── subject_test.txt
│       │   ├── X_test.txt
│       │   └── y_test.txt
│       └── train
│           ├── Inertial Signals
│           │   ├── body_acc_x_train.txt
│           │   ├── body_acc_y_train.txt
│           │   ├── body_acc_z_train.txt
│           │   ├── body_gyro_x_train.txt
│           │   ├── body_gyro_y_train.txt
│           │   ├── body_gyro_z_train.txt
│           │   ├── total_acc_x_train.txt
│           │   ├── total_acc_y_train.txt
│           │   └── total_acc_z_train.txt
│           ├── subject_train.txt
│           ├── X_train.txt
│           └── y_train.txt
├── rawData                                            # Downloaded Raw dataset
│   └── rawData.zip
├── README.md                                          # This README
├── run.R                                              # R Script
└── tidy_results.txt                                   # Tidy Results
