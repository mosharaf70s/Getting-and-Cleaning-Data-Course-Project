Getting and Cleaning Datasest of Human  Activity Recognition Using Smartphones Dataset Version 1.0

Study Design

The data was gathered by the group of Jorge Reyes-Ortiz, Davide Anguita and their colleagues. 

From the README file of the downloaded datase, in verbatim, 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/sec2).
- The gyroscope units are rad/sec. 
- Frequency units are Hertz (Hz)

Signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
        
        tBodyAcc-XYZ - Time Body Acceleration XYZ
        tGravityAcc-XYZ - Time Gravity Acceleration XYZ
        tBodyAccJerk-XYZ - Time Body Acceleration Jerk XYZ
        tBodyGyro-XYZ - Time Body Gyroscope XYZ
        tBodyGyroJerk-XYZ - Time Body Gyroscope Jerk XYZ
        tBodyAccMag - Time Body Acceleration Magnitude 
        tGravityAccMag - Time Gravity Acceleration Magnitude
        tBodyAccJerkMag - Time Body Acceleration Jerk Magnitude
        tBodyGyroMag - Time Body Gyroscope MAgnitude
        tBodyGyroJerkMag - Time Body Gyroscope Jerk Magnitude
        fBodyAcc-XYZ - frequency Body Acceleration XYZ
        fBodyAccJerk-XYZ - Frequency Body Acceleration Jerk XYZ
        fBodyGyro-XYZ - Frequency Body Gyroscope XYZ
        fBodyAccMag - Frequency Body Acceleration Magnitude
        fBodyAccJerkMag - Frequency Body Acceleration Jerk Magnitude
        fBodyGyroMag - Frequency Body Gyroscope Magnitude
        fBodyGyroJerkMag - Frequency Body Gyroscope Jerk Magnitude

The set of variables that were estimated from these signals are: 

        mean(): Mean value
        std(): Standard deviation
        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
        maxInds(): index of the frequency component with largest magnitude
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        skewness(): skewness of the frequency domain signal 
        kurtosis(): kurtosis of the frequency domain signal 
        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
        angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

        gravityMean - Mean Gravity
        tBodyAccMean - Time Body Acceleration Mean
        tBodyAccJerkMean - Time Body Acceleration Jerk Mean
        tBodyGyroMean - Time Body Gyroscope Mean
        tBodyGyroJerkMean - Time Boddy Gyroscope Jerk Mean

The final dataset to be obtained in this R code is an independent tidy data set with the average of each variable for each activity and each subject.

The transformations done in order to achieve the final output are:

        In cleaning the data set:
        1. the column names for the data columns of the training and test sets were assigned from the feature vector. the subject and the activity number were also named.
        2. Each training and the test sets were merged by columns with the activity number and subject. Then, both data sets were merged by rows using rbind().
        3. the measurements on mean and standard deviation were extracted by creating logical vectors of the column names with the following characters using grepl(). The logical vector with TRUEs is then used to extract the mean and stdev.
        4. The labels of the data set in 3 were changed to descriptive variable names using gsub(). 
        5. Indenpendent tidy data set was obtained by taking the average of each variables for each activity and each subject using aggregate() and order().
        6. A text file of the tidy data is then generated and saved.
        
        
        

