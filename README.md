##Preview
This is my submission for the course project for "Getting and cleaning data", offered by John Hopkins University and Coursera and included in the Data Science Specialization.

In this GitHub repo you will find, besides this README.md, an R Script (run_analysis.R) containing the actual code used for cleaning the data, and a CodeBook.md with the description of the variables that form the tidy data set.

Code for reading "tidydataset.txt" back into R is included at the end of run_analysis.R.

##Instructions for reading the run_analysis.R
The original data for this assignment can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R assumes that the files contained in the .zip have been **downloaded and unzipped into a folder named "data" inside your working directory**. The names of the .txt files have not been modified.

###Steps
**Step 1** consists in merging all the data files into one single dataset. CTA David Hood made a really useful diagram of how the different files fit together, it can be checked here: https://class.coursera.org/getdata-007/forum/thread?thread_id=49#comment-570

In the process of merging, we have used cbind() and rbind(). We have opted for merging first the train and test sets for each part with rbind and then merging them together with cbind. Another possible approach could have been to merge all the train set files together with cbind, then do the same for all test files, then merge the two datasets with rbind. Both approaches are fine as long as you keep in mind that you should apply the same logic to all the parts.

If you follow the steps in this part of the code, you should end with a data.frame named total. 

dim(total) returns 10299 rows * 564 columns.


**Step 2** asks to filter the variables that refer to mean and standard deviation. The rest of the variables (those that refer to iqr, correlation, max/min...) should be discarded.

For the selection, we use dplyr's select() and contains(). Contains allows us to search for colnames that have the "mean()" and "std()" expressions that we are looking for. The \\ command is used before each parenthesis ("\\(\\)") to indicate that it should interpret the ( and ) signs as characters.

In the dataset there are some columns of type angle(tBodyAccMean,gravity) (col 555). Since the measurement doesn't refer properly to a mean, but instead *uses a mean as an argument*, we've decided to exclude them. For the same reason, we have excluded the columns with meanFreq().

As we have it now, dim(filtered) returns 10299 rows * 68 columns

**Step 3** is formed by commands to rename the variables programmatically so they have clear and readable names. 

We use sub() and gsub() to remove non-alphanumerical characters such as "-", parenthesis or whitespaces, rename some parts of the name ("Acc" to "Accelerometer", etc), specify that -x, -y and -z refer to axis and "t" and "f" to time and frequency.

Running colnames(filtered) returns a vector of 68 strings. The first two correspond to subject and activity (no changes made here), the other 66 follow the synthax: DomainTypeOfMeasurementSourceMeasurement(mean/SD)axis, i.e, colnames(filtered)[3] is "TimeBodyAccelerometerMEANXaxis". 

Note that, since we are not explained what we want the data for, it is difficult to find a terminology that could fit all uses. In this sense, this terminology should be considered "tidy", since it respects, not only the intention and logic of the original study, but also the integrity of the data. One obvious downside of this method is that resulting names are long, but we have taken into consideration that, if we split each variable in a way to get the variables in the most tidy form (i.e, splitting the data by domain, type of measurement, source of the data, axis), we are going to get data with lots of NAs, so what we clean on one side, gets dirtier on the other.

It is also worth noting that I've used "camel case" (that means, without whitespaces but using capital letters to mark the beginning of each word) to improve human readability. At some point, though, someone might consider that it could make the variable names error-prone and it could difficult to analyze them. This issue has been addressed in the forums too (in this discussion, for instance: https://class.coursera.org/getdata-007/forum/thread?thread_id=249). If needed, we could add a line to the script like

colnames(filtered)<-tolower(colnames(filtered))

To get all the names in lower case. If we were going that route, we should change the calls in the subsequent script (for instance, if we are making a call to filtered$Activity, instead it should be filtered$activity).


**Step 4** asks to label the activities with meaningful names, since now they are only numerical codes. The "legend" for this can be found in the "activity_labels.txt" file in the original zip, and once we read it it consists of a 2*6 dataframe, the first column with the index and the second with the description. 

Since filtered$Activity is integer (not a factor yet) and numerical values for these labels match the row numbers (i.e., activity labeled 1 is in row 1, activity labeled 2 is in row 2, and so forth) we can rename the Activity column using the vectorial properties of R, with

filtered$Activity<-labels[filtered$Activity, 2] 

str(filtered$Activity) returns "Factor w/6 levels "LAYING", "SITTING", ..: 333333..."

**Step 5** is the final step of the process. We use the melt() and dcast() functions (in the reshape2 package) to reorder the measurements in a narrow form, in function of the subject and the activity (with melt()) and then create a new dataset (in the wide form) that contains one single line for each pair of Subject-Activity (with dcast()).

mfiltered is the melted file. dim(mfiltered) returns 679734 rows * 4 columns. We have added the string "Avg" to the variables to indicate that the values will be (in the next step) averages, not real measurements.

Then we dcast mfiltered to obtain the data.frame tidy, which finally contains the mean of each measurement for each Subject-Activity pair. dim(tidy) returns 180 rows * 68 columns.