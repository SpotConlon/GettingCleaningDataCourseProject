Load the tidy_data_set using the following command: 
=========================================

tidy_data_set <- read.table("tidy_data_set path",header=TRUE,sep=",")
##where "tidy_data_set path" is based on where you are storing the tidy_data_set

##Example
- tidy_data_set = "https://s3.amazonaws.com/coursera-uploads/peer-review/ed9d237da0ebe1a9a20143e0e47a99b0/tidy_data_set"
- tidy_data_set = read.table(tidy_data_set,header=TRUE,sep=",")

Please refer to the codebook for information around the structure of the tidy_data_set (variables, aggregation methods, units and other relevant details).

The GitHub Repo includes the following files:
=========================================

- 'README.md'

- 'codebook.txt': Shows information about the variables used on the feature vector.

- 'run_analysis.R': The R script used to generate the tidy_data_set.

- 'tidy_data_set': The final tidy_data_set.

The run_analysis.R script executes as follows:
=========================================
Loads the Reshape2 package which is used towards the end of the script

Loads raw data sets w/ read.table
  - Loads activity labels
  - Loads feature names
  - Loads raw training and testing data sets including subject files

Cleans up column headers using the names function
  - Assigns activity_labels column header
  - Assigns feature names (aka descriptive variable names)
  - Renames the label file headers so it's clear they are activity codes
  - Assigns ID header to subject data sets
  
Merges the testing and training data sets using cbind and rbind

Pulls out only those feature columns that contain mean and std deviation data using grepl

Assigns/maps the activity codes to descriptive activity names using match

Creates the final tidy data set using the reshape2 package to convert long to wide format via melt and cast
  - Melts on subject and activity
  - Casts and mean aggregation

The following relates to the raw data that was used to create the tidy_data_set and credits the original authors as appropriate:
=========================================

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 79-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes: 
======
For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
