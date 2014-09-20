##Preview
This is my submission for the course project for "Getting and cleaning data", a class offered by John Hopkins University and Coursera and included in the Data Science Specialization offered by these two institutions.<\p>
In this GitHub repo you will find, besides this README.md, an R Script (run_analysis.R) containing the actual code used for cleaning data, and a CodeBook.md with the description of the variables that form the new file.
Code for reading "tidydataset.txt" back into R is included at the end of run_analysis.R

##Instructions for reading the run_analysis.R
The code assume that the files contained in the .zip have been downloaded and unzipped into a folder named "data" inside your working directory. The names of the .txt files have not been modified.
The original data for this assignment can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
It is accompanied by a CodeBook.

##Steps
Step 1 consists in merging all the data files into one single dataset. If you follow the steps in this part of the code, you will end with a data.frame named total. dim(total) gives us 10299 rows * 564 columns.

Step 2 asks to filter
talk about the discarded files
using the dplyr package, we can use select() and contains(). We use this command to rearrange the dataset, so columns refering to Subject and Activity fall to the left. contains allows us to search for colnames that have the "mean()" and "std()" expressions that we are looking for. The \\ command is used before each parenthesis ("\\(\\)") to indicate that it should interpret the ( and ) signs as characters.
As for the cols named FreqMean... Since at this point of the analysis we have not executed any sensible (i.e. order-altering) operations on the dataset, if we are asked, we could easily add them with another filter like 
filtered2<-select(total, contains("FreqMeans")), and then filtered<-cbind(filtered, filtered2)
As we have it now, dim(filtered) returns 10299 rows * 68 columns

Step 3 is just a bunch of commands to rename the variables programmatically so they have clear and readable names. We use sub() and gsub() to remove parenthesis and "-", rename some parts ("Acc" to "Accelerometer", etc), specify that -x, -y and -z refer to axis and "t" and "f" to time and frequency, and remove blank spaces and substitute them for "_".
Running colnames(filtered) returns a vector of 68 strings. The first two correspond to subject and activity (no changes made here), the other 66 follow the synthax: Domain_TypeOfMeasurement_Source_Measurement(mean/SD)_axis, i.e, colnames(filtered)[3] is "Time_Body_Accelerometer__MEAN_X_axis"

Step 4 asks to label the activities with meaningful names, since now they are only numerical codes. The "legend" for this can be found in the "activity_labels.txt" file in the original zip, and once we read it it consists of a 2*6 dataframe, the first column with the index and the second with the description. We rename the Activity column in our dataset using this info and the vectorial properties of R, with 
filtered$Activity<-labels[filtered$Activity, 2]. str(filtered$Activity) returns "Factor w/6 levels "LAYING", "SITTING", ..: 333333..."

Step 5 is the final step of the process. We use the melt() and dcast() functions (in the reshape2 package) to reorder the measurements in function of the subject and the activity (with melt()) and then create a new dataset that contains one single line for each pair of Subject-Activity (with dcast()).
mfiltered is the melted file. dim(mfiltered) returns 679734 rows * 4 columns. Since all the variables are now in a single column, we rename them to add the term "Average" at the beginning, since it's more clear of what we are doing.
then we dcast mfiltered to obtain the data.frame tidy, which finally contains the mean of each measurement for each Subject-Activity pair. dim(tidy) returns 180 rows * 68 columns.