#Download database

filename <- "Project_Coursera_Getting.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Defining data frames
feature <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activit <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feature$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feature$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")



# 1 - Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Resume <- rbind(subj_train, subj_test)
Merged <- cbind(Resume, Y, X)


#2 - Extracts only the measurements on the mean and standard deviation for each measurement.
Tidy <- Merged %>% select(subject, code, contains("mean"), contains("std"))


#3 - Uses descriptive activity names to name the activities in the data set.
Tidy$code <- activit[Tidy$code, 2]


#4 - Appropriately labels the data set with descriptive variable names.
names(Tidy)[2] = "activity"
names(Tidy)<-gsub("Acc", "Acceler", names(Tidy))
names(Tidy)<-gsub("Gyro", "Gyroscope", names(Tidy))
names(Tidy)<-gsub("BodyBody", "Body2", names(Tidy))
names(Tidy)<-gsub("Mag", "Magnitude", names(Tidy))
names(Tidy)<-gsub("^t", "Time", names(Tidy))
names(Tidy)<-gsub("^f", "Frequency", names(Tidy))
names(Tidy)<-gsub("TBody", "TimeBody", names(Tidy))
names(Tidy)<-gsub("-mean()", "Mean", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("-std()", "STD", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("-freq()", "Frequency", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("angle", "Angle", names(Tidy))
names(Tidy)<-gsub("gravity", "Gravity", names(Tidy))


#5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Finish <- Tidy %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(Finish, "Finish.txt", row.name=FALSE)



