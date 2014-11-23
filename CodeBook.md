# The data linked were collected from the accelerometers on the Samsung Galaxy S smartphone.  
# The data is downloaded from the follwing website
#### http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

this script uses the 'dplyr' package.

lines 8-16 prepares temporary directories and files to download the files.  the file is downloaded on line 18 in the temporary variable 'tf'. the variable 'fnames' on line 21 contains the names of all the files.

in lines 26-32 the file 'features.txt' is read into the variable 'features'.

in lines 36-42 the file 'subject_test.txt' is read into the variable `subject_test`

in lines 

script for the project in coursera's 'getting and cleaning data' course. this script performs the steps 1-5 in the course project. the variable 'data' on line 120 accomplishes step 1. it merges the files X_test and Xtrain into one data frame. the fist column is the subject, the second is the activity, and the rest of the columns are the data. the column names are the features file.
