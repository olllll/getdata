##code for course project for Coursera' Getting and cleaning data course project
 ##see ReadMe.md for clarification on the process

##step 1: Merges the training and the test sets to create one data set.

train<-read.table("./data/train/X_train.txt")
test<-read.table("./data/test/X_test.txt")
total<-rbind(train, test)

variables<-read.table("./data/features.txt", stringsAsFactors = FALSE)
colnames(total)<-variables[,"V2"]

sub_train<-read.table("./data/train/subject_train.txt")
sub_test<-read.table("./data/test/subject_test.txt")
sub_total<-rbind(sub_train, sub_test)
colnames(sub_total)<-"Subject"

total<-cbind(total, sub_total)

activity_train<-read.table("./data/train/y_train.txt")
activity_test<-read.table("./data/test/y_test.txt")

activity_total<-rbind(activity_train, activity_test)
colnames(activity_total)<-"Activity"

total<-cbind(total, activity_total)


####################################################################
##step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr) ##select, contains
filtered<-select(total, Subject, Activity, contains("mean\\(\\)"), contains("std\\(\\)"))
dim(filtered)
###################################################################
##step 3: Uses descriptive activity names to name the activities in the data set

colnames(filtered)<-gsub("()", "", colnames(filtered), fixed = TRUE)
colnames(filtered)<-sub("Acc", " Accelerometer ", colnames(filtered))
colnames(filtered)<-sub("Gyro", " Gyroscope ", colnames(filtered))
colnames(filtered)<-gsub("BodyBody", "Body", colnames(filtered))
colnames(filtered)<-gsub("Body", " Body ", colnames(filtered))
##first occurence of "-" refers to the mean or std
colnames(filtered)<-sub("-", " ", colnames(filtered))

colnames(filtered)<-sub("-X", " X axis", colnames(filtered))
colnames(filtered)<-sub("-Y", " Y axis", colnames(filtered))
colnames(filtered)<-sub("-Z", " Z axis", colnames(filtered))

colnames(filtered)<-sub("mean", "MEAN", colnames(filtered))
colnames(filtered)<-sub("std", "SD", colnames(filtered))
colnames(filtered)<-gsub("Gravity", " Gravity", colnames(filtered))

colnames(filtered)<-sub("t ", "Time ", colnames(filtered))
colnames(filtered)<-sub("f ", "Frequency ", colnames(filtered))
colnames(filtered)<-sub("Mag ", " Magnitude ", colnames(filtered))

#remove whitespaces
colnames(filtered)<-gsub(" ", "", colnames(filtered))

############################################################################3
##step 4: Appropriately labels the data set with descriptive variable names. 
labels<-read.table("./data/activity_labels.txt")
filtered$Activity<-labels[filtered$Activity, 2]

#########################################################################
##step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

filtered$Subject<-as.factor(filtered$Subject)
library(reshape2) ##melt, dcast
mfiltered<-melt(filtered, id = c("Subject", "Activity"))
mfiltered$variable<-paste(mfiltered$variable, "Avg", sep = "")
tidy<-dcast(mfiltered, Subject + Activity ~ variable, mean)

##############################################
##write to file

write.table(tidy, "./tidydataset.txt", row.name = FALSE)
colnames(tidy)
#############################################
##read back
check<-read.table("./tidydataset.txt", header = TRUE)
head(check, n = 10)
