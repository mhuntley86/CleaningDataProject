# CodeBook for Getting and Cleaning Data Final Project

## Variable Descriptions
The variables selected come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'TimeDomain') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (denoted in names as Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing variables beginning with FrequencyDomain. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Each variable is averaged per subject (subjectID) and activity (Activity).

### List of variables
*subjectId
*Activity
*TimeDomain.Body.Accelerometer.Mean.X
*TimeDomain.Body.Accelerometer.Mean.Y
*TimeDomain.Body.Accelerometer.Mean.Z
*TimeDomain.Body.Accelerometer.Std.X
*TimeDomain.Body.Accelerometer.Std.Y
*TimeDomain.Body.Accelerometer.Std.Z
*TimeDomain.Gravity.Accelerometer.Mean.X
*TimeDomain.Gravity.Accelerometer.Mean.Y
*TimeDomain.Gravity.Accelerometer.Mean.Z
*TimeDomain.Gravity.Accelerometer.Std.X
*TimeDomain.Gravity.Accelerometer.Std.Y
*TimeDomain.Gravity.Accelerometer.Std.Z
*TimeDomain.Body.Accelerometer.Jerk.Mean.X
*TimeDomain.Body.Accelerometer.Jerk.Mean.Y
*TimeDomain.Body.Accelerometer.Jerk.Mean.Z
*TimeDomain.Body.Accelerometer.Jerk.Std.X
*TimeDomain.Body.Accelerometer.Jerk.Std.Y
*TimeDomain.Body.Accelerometer.Jerk.Std.Z
*TimeDomain.Body.Gyroscope.Mean.X
*TimeDomain.Body.Gyroscope.Mean.Y
*TimeDomain.Body.Gyroscope.Mean.Z
*TimeDomain.Body.Gyroscope.Std.X
*TimeDomain.Body.Gyroscope.Std.Y
*TimeDomain.Body.Gyroscope.Std.Z
*TimeDomain.Body.Gyroscope.Jerk.Mean.X
*TimeDomain.Body.Gyroscope.Jerk.Mean.Y
*TimeDomain.Body.Gyroscope.Jerk.Mean.Z
*TimeDomain.Body.Gyroscope.Jerk.Std.X
*TimeDomain.Body.Gyroscope.Jerk.Std.Y
*TimeDomain.Body.Gyroscope.Jerk.Std.Z
*TimeDomain.Body.Accelerometer.Magnitude.Mean
*TimeDomain.Body.Accelerometer.Magnitude.Std
*TimeDomain.Gravity.Accelerometer.Magnitude.Mean
*TimeDomain.Gravity.Accelerometer.Magnitude.Std
*TimeDomain.Body.Accelerometer.Jerk.Magnitude.Mean
*TimeDomain.Body.Accelerometer.Jerk.Magnitude.Std
*TimeDomain.Body.Gyroscope.Magnitude.Mean
*TimeDomain.Body.Gyroscope.Magnitude.Std
*TimeDomain.Body.Gyroscope.Jerk.Magnitude.Mean
*TimeDomain.Body.Gyroscope.Jerk.Magnitude.Std
*FrequencyuencyDomain.Body.Accelerometer.Mean.X
*FrequencyuencyDomain.Body.Accelerometer.Mean.Y
*FrequencyuencyDomain.Body.Accelerometer.Mean.Z
*FrequencyuencyDomain.Body.Accelerometer.Std.X
*FrequencyuencyDomain.Body.Accelerometer.Std.Y
*FrequencyuencyDomain.Body.Accelerometer.Std.Z
*FrequencyuencyDomain.Body.Accelerometer.Mean.Frequency.X
*FrequencyuencyDomain.Body.Accelerometer.Mean.Frequency.Y
*FrequencyuencyDomain.Body.Accelerometer.Mean.Frequency.Z
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Mean.X
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Mean.Y
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Mean.Z
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Std.X
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Std.Y
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Std.Z
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Mean.Frequency.X
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Mean.Frequency.Y
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Mean.Frequency.Z
*FrequencyuencyDomain.Body.Gyroscope.Mean.X
*FrequencyuencyDomain.Body.Gyroscope.Mean.Y
*FrequencyuencyDomain.Body.Gyroscope.Mean.Z
*FrequencyuencyDomain.Body.Gyroscope.Std.X
*FrequencyuencyDomain.Body.Gyroscope.Std.Y
*FrequencyuencyDomain.Body.Gyroscope.Std.Z
*FrequencyuencyDomain.Body.Gyroscope.Mean.Frequency.X
*FrequencyuencyDomain.Body.Gyroscope.Mean.Frequency.Y
*FrequencyuencyDomain.Body.Gyroscope.Mean.Frequency.Z
*FrequencyuencyDomain.Body.Accelerometer.Magnitude.Mean
*FrequencyuencyDomain.Body.Accelerometer.Magnitude.Std
*FrequencyuencyDomain.Body.Accelerometer.Magnitude.Mean.Frequency
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Magnitude.Mean
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Magnitude.Std
*FrequencyuencyDomain.Body.Accelerometer.Jerk.Magnitude.Mean.Frequency
*FrequencyuencyDomain.Body.Gyroscope.Magnitude.Mean
*FrequencyuencyDomain.Body.Gyroscope.Magnitude.Std
*FrequencyuencyDomain.Body.Gyroscope.Magnitude.Mean.Frequency
*FrequencyuencyDomain.Body.Gyroscope.Jerk.Magnitude.Mean
*FrequencyuencyDomain.Body.Gyroscope.Jerk.Magnitude.Std
*FrequencyuencyDomain.Body.Gyroscope.Jerk.Magnitude.Mean.Frequency
