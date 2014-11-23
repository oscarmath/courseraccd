courseraccd
===========

script for the project in coursera's 'getting and cleaning data' course.  this script performs the steps 1-5 in the course project. the variable 'data' on line 120 accomplishes step 1.  it merges the files X_test and Xtrain into one data frame.  the fist column is the subject, the second is the activity, and the rest of the columns are the data.  the column names are the features file.

the variable 'data_meanstd' on line 127 accomplishes steps 2-4.  it extracts from 'data' those columns that contain a means and std measurement.  the firsth column is the subject, second column is the activity, and the rest of the columns are the data.

the variable 'tidydata_means' completed in line 142 accomplishes step 5 of the assignment.  it contains the mean for each variable in step 4 for each subject and each activity.
