##Summary
Data obtained from calculating the average from each unique combination of Subject and Activity, from the original "Human Activity Recognition Using Smartphones Dataset" elaborated by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto (Smartlab, Università degli Studi di Genova).

The study measured certain data collected from the accelerometer and the gyroscope of a smartphone (a Samsung Galaxy S2) while the subjects (30) did six kinds of activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS). Values obtained were normalized and bounded within [-1, 1].

Here is a quote to the original codebook ("features_info.txt") that explains how data were collected and ellaborated:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern."


From this original dataset, data were processed using the R programming language. We selected the variables that referred to the mean and standard deviation, renamed the variables with more user-friendly names and extracted a mean for each unique combination of subject-activity in all the variables. run_analysis.R contains the actual code used, and README.md contains clarifications about the process.

##Variables 
###Descriptive variables
1 "Subject"
A unique ID for each subject in the experiment, represented by an integer from 1 to 30

2 "Activity"
A factor representing the 6 activities performed in the experiment: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS,WALKING_UPSTAIRS

###Frequency Domain variables
3 "FrequencyBodyAccelerometerJerkMagnitudeMEANAvg"
Average of the means for the Jerk Magnitude obtained by the Accelerometer. Normalized and bounded within [-1, 1].

4 "FrequencyBodyAccelerometerJerkMagnitudeSDAvg"
Average of the standard deviations for the Jerk Magnitude obtained by the Accelerometer. Normalized and bounded within [-1, 1].

5 "FrequencyBodyAccelerometerJerkMEANXaxisAvg"
Average of the means for the Jerk Magnitude obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

6 "FrequencyBodyAccelerometerJerkMEANYaxisAvg"
Average of the means for the Jerk Magnitude obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

7 "FrequencyBodyAccelerometerJerkMEANZaxisAvg"
Average of the means for the Jerk Magnitude obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

8 "FrequencyBodyAccelerometerJerkSDXaxisAvg"
Average of the standard deviations for the Jerk Magnitude obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

9 "FrequencyBodyAccelerometerJerkSDYaxisAvg"
Average of the standard deviations for the Jerk Magnitude obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

10 "FrequencyBodyAccelerometerJerkSDZaxisAvg"
Average of the standard deviations for the Jerk Magnitude obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

11 "FrequencyBodyAccelerometerMagnitudeMEANAvg"
Average of the means for the Magnitude obtained by the Accelerometer. Normalized and bounded within [-1, 1].

12 "FrequencyBodyAccelerometerMagnitudeSDAvg"
Average of the standard deviations for the Magnitude obtained by the Accelerometer. Normalized and bounded within [-1, 1].

13 "FrequencyBodyAccelerometerMEANXaxisAvg"
Average of the means for the body acceleration obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

14 "FrequencyBodyAccelerometerMEANYaxisAvg"
Average of the means for the body acceleration obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

15 "FrequencyBodyAccelerometerMEANZaxisAvg"
Average of the means for the body acceleration obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

16 "FrequencyBodyAccelerometerSDXaxisAvg"
Average of the standard deviations for the body acceleration obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

17 "FrequencyBodyAccelerometerSDYaxisAvg"
Average of the standard deviations for the body acceleration obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

18 "FrequencyBodyAccelerometerSDZaxisAvg"
Average of the standard deviations for the body acceleration obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

19 "FrequencyBodyGyroscopeJerkMagnitudeMEANAvg"
Average of the means for the Jerk magnitude obtained by the Gyroscope. Normalized and bounded within [-1, 1].

20 "FrequencyBodyGyroscopeJerkMagnitudeSDAvg"
Average of the standard deviations for the Jerk magnitude obtained by the Gyroscope. Normalized and bounded within [-1, 1].

21 "FrequencyBodyGyroscopeMagnitudeMEANAvg"
Average of the means for the magnitude obtained by the Gyroscope. Normalized and bounded within [-1, 1].

22 "FrequencyBodyGyroscopeMagnitudeSDAvg"
Average of the standard deviations for the magnitude obtained by the Gyroscope. Normalized and bounded within [-1, 1].

23 "FrequencyBodyGyroscopeMEANXaxisAvg"
Average of the means for the magnitude obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

24 "FrequencyBodyGyroscopeMEANYaxisAvg"
Average of the means for the magnitude obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

25 "FrequencyBodyGyroscopeMEANZaxisAvg"
Average of the means for the magnitude obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

26 "FrequencyBodyGyroscopeSDXaxisAvg"
Average of the standard deviations for the magnitude obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

27 "FrequencyBodyGyroscopeSDYaxisAvg"
Average of the standard deviations for the magnitude obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

28 "FrequencyBodyGyroscopeSDZaxisAvg"
Average of the standard deviations for the magnitude obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

###Time domain variables
29 "TimeBodyAccelerometerJerkMagnitudeMEANAvg"
Average of the means for the Jerk Magnitude of the body acceleration obtained by the Accelerometer. Normalized and bounded within [-1, 1].

30 "TimeBodyAccelerometerJerkMagnitudeSDAvg"
Average of the standard deviations for the Jerk Magnitude of the body acceleration obtained by the Accelerometer. Normalized and bounded within [-1, 1].

31 "TimeBodyAccelerometerJerkMEANXaxisAvg"
Average of the means for the Jerk of the body acceleration obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

32 "TimeBodyAccelerometerJerkMEANYaxisAvg"
Average of the means for the Jerk of the body acceleration obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

33 "TimeBodyAccelerometerJerkMEANZaxisAvg"
Average of the means for the Jerk of the body acceleration obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

34 "TimeBodyAccelerometerJerkSDXaxisAvg"
Average of the standard deviations for the Jerk of the body acceleration obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

35 "TimeBodyAccelerometerJerkSDYaxisAvg"
Average of the standard deviations for the Jerk of the body acceleration obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

36 "TimeBodyAccelerometerJerkSDZaxisAvg"
Average of the standard deviations for the Jerk of the body acceleration obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

37 "TimeBodyAccelerometerMagnitudeMEANAvg"
Average of the means for the Magnitude of the body acceleration obtained by the Accelerometer. Normalized and bounded within [-1, 1].

38 "TimeBodyAccelerometerMagnitudeSDAvg"
Average of the standard deviations for the Magnitude of the body acceleration obtained by the Accelerometer. Normalized and bounded within [-1, 1].

39 "TimeBodyAccelerometerMEANXaxisAvg"
Average of the means for the Magnitude of the body acceleration obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

40 "TimeBodyAccelerometerMEANYaxisAvg"
Average of the means for the Magnitude of the body acceleration obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

41 "TimeBodyAccelerometerMEANZaxisAvg"
Average of the means for the Magnitude of the body acceleration obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

42 "TimeBodyAccelerometerSDXaxisAvg"
Average of the standard deviations for the Magnitude of the body acceleration obtained by the Accelerometer on the X axis. Normalized and bounded within [-1, 1].

43 "TimeBodyAccelerometerSDYaxisAvg"
Average of the standard deviations for the Magnitude of the body acceleration obtained by the Accelerometer on the Y axis. Normalized and bounded within [-1, 1].

44 "TimeBodyAccelerometerSDZaxisAvg"
Average of the standard deviations for the Magnitude of the body acceleration obtained by the Accelerometer on the Z axis. Normalized and bounded within [-1, 1].

45 "TimeBodyGyroscopeJerkMagnitudeMEANAvg"
Average of the means for the Jerk Magnitude of the body acceleration obtained by the Gyroscope. Normalized and bounded within [-1, 1].

46 "TimeBodyGyroscopeJerkMagnitudeSDAvg"
Average of the standard deviations for the Jerk Magnitude of the body acceleration obtained by the Gyroscope. Normalized and bounded within [-1, 1].

47 "TimeBodyGyroscopeJerkMEANXaxisAvg"
Average of the means for the Jerk of the body acceleration obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

48 "TimeBodyGyroscopeJerkMEANYaxisAvg"
Average of the means for the Jerk of the body acceleration obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

49 "TimeBodyGyroscopeJerkMEANZaxisAvg"
Average of the means for the Jerk of the body acceleration obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

50 "TimeBodyGyroscopeJerkSDXaxisAvg"
Average of the standard deviations for the Jerk of the body acceleration obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

51 "TimeBodyGyroscopeJerkSDYaxisAvg"
Average of the standard deviations for the Jerk of the body acceleration obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

52 "TimeBodyGyroscopeJerkSDZaxisAvg"
Average of the standard deviations for the Jerk of the body acceleration obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

53 "TimeBodyGyroscopeMagnitudeMEANAvg"
Average of the means for the Magnitude of the body acceleration obtained by the Gyroscope. Normalized and bounded within [-1, 1].

54 "TimeBodyGyroscopeMagnitudeSDAvg"
Average of the standard deviations for the Magnitude of the body acceleration obtained by the Gyroscope. Normalized and bounded within [-1, 1].

55 "TimeBodyGyroscopeMEANXaxisAvg"
Average of the means for the body acceleration obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

56 "TimeBodyGyroscopeMEANYaxisAvg"
Average of the means for the body acceleration obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

57 "TimeBodyGyroscopeMEANZaxisAvg"
Average of the means for the body acceleration obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

58 "TimeBodyGyroscopeSDXaxisAvg"
Average of the standard deviations for the body acceleration obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

59 "TimeBodyGyroscopeSDYaxisAvg"
Average of the standard deviations for the body acceleration obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

60 "TimeBodyGyroscopeSDZaxisAvg"
Average of the standard deviations for the body acceleration obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

61 "TimeGravityAccelerometerMagnitudeMEANAvg"
Average of the means for the Magnitude of the gravity acceleration obtained by the Gyroscope. Normalized and bounded within [-1, 1].

62 "TimeGravityAccelerometerMagnitudeSDAvg"
Average of the standard deviations for the Magnitude of the gravity acceleration obtained by the Gyroscope. Normalized and bounded within [-1, 1].

63 "TimeGravityAccelerometerMEANXaxisAvg"
Average of the means for the gravity acceleration obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

64 "TimeGravityAccelerometerMEANYaxisAvg"
Average of the means for the gravity acceleration obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

65 "TimeGravityAccelerometerMEANZaxisAvg"
Average of the means for the gravity acceleration obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].

66 "TimeGravityAccelerometerSDXaxisAvg"
Average of the standard deviations for the gravity acceleration obtained by the Gyroscope on the X axis. Normalized and bounded within [-1, 1].

67 "TimeGravityAccelerometerSDYaxisAvg"
Average of the standard deviations for the gravity acceleration obtained by the Gyroscope on the Y axis. Normalized and bounded within [-1, 1].

68 "TimeGravityAccelerometerSDZaxisAvg"
Average of the standard deviations for the gravity acceleration obtained by the Gyroscope on the Z axis. Normalized and bounded within [-1, 1].