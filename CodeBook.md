The run_analysis.R has all information in R. 

Assigning data frames:
feature <- features.txt : 561 rows, 2 columns 
These information come from the acceler and gyroscope.
activit <- activity_labels.txt : 6 rows, 2 columns 
Activities made whenthe corresponding measurements were taken.
subj_test <- test/subject_test.txt : 2947 rows, 1 column 
contains test data of 9/30 volunteer test subjects.
x_test <- test/X_test.txt : 2947 rows, 561 columns 
record features test data.
y_test <- test/y_test.txt : 2947 rows, 1 columns 
Test data os activit codes
subj_train <- test/subject_train.txt : 7352 rows, 1 column 
contains train data of 21/30 volunteer subjects.
x_train <- test/X_train.txt : 7352 rows, 561 columns 
contains recorded features train data.
y_train <- test/y_train.txt : 7352 rows, 1 columns 
contains train data of activit’code labels

1 - Merges the training and the test sets to create one data set
X (10299 rows, 561 columns) is created by merging x_train and x_test.
Y (10299 rows, 1 column) is created by merging y_train and y_test.
Resume (10299 rows, 1 column) is created by merging subj_train and subj_test.
Merged (10299 rows, 563 column) is created by merging Resume, Y and X.

2 - Extracts only the measurements on the mean and standard deviation for each measurement
Tidy (10299 rows, 88 columns) is created by subsetting Merged, selecting only columns: subject, code and the measurements on the mean and std for each measurement.

3 - Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the Tidy replaced with corresponding activity taken from second column of the  activit variable

4 - Appropriately labels the data set with descriptive variable names
code column in Tidy renamed into activity.
All Acc in column’s name replaced by Acceler
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body2
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Finish (180 rows, 88 columns) is created by sumarizing Tidy taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export Finish into Finish.txt file.
