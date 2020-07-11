Getting and Cleaning Data Project Code Book

Author: Katherine Williams

Source Data: 
Data and Indepth Description can be found here "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Attribute Inforamtion

Each record in the data set has a 
- triaxial acceleration (from accelerometer)
- Triaxial aggular velocity (from gyroscope)
- A 561-feature vector with time and frequency variables
- An activity label
- Subject ID for the individual doing the activity

Data Analysis Steps
1. Data are downloaded from UCI repository and unzipped into the working directory
2. The data for activity, subject, and feature are uploaded to R 
3. The individual datasets "test" and "train" are merged for each category (subject, activity, feature)
4. Labels in the activity data set are made factorial and the names are changed to reflect the names in activity_labels.txt
5. Activity and Subject Labels are created
6. Feature Column is named using features.txt
7. Data are subsetted for mean and standard deviation
8. All Data are merged based on subject ids and activity
9. Time and Frequency Variables are Clarified
10. New clean data set is created as a .txt file
