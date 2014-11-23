# The data linked were collected from the accelerometers on the Samsung Galaxy S smartphone.  
# The data is downloaded from the follwing website
#### http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

this script uses the 'dplyr' package.

lines 8-16 prepares temporary directories and files to download the files.  the file is downloaded on line 18 in the temporary variable 'tf'. the variable 'fnames' on line 21 contains the names of all the files.

in lines 26-32 the file 'features.txt' is read into the variable `features`

in lines 36-42 the file 'subject_test.txt' is read into the variable `subject_test`

in lines 46-52 the file 'X_test.txt' is read into the variable `X_test`

in lines 56-62 the file 'y_test.txt' is read into the variable `y_text`

in lines 66-72 the file 'subject_train.txt' is read into the variable `subject_train`

in lines 76-82 the file 'X_train.txt' is read into the variable `X_train`

in lines 86-92 the file 'y_train.txt' is read into the variable `y_train`

lines 96-97 delete temporary files

lines 105-122 construct the variable 'data' which accomplishes step 1 of the course assignment. it merges the files `X_test` and `X_train` into one data frame.  the merge is accomplished using rbind. the fist column of 'data' is the subject, the second is the activity, and the rest of the columns are the data. the column names are the 'features' file.  the activities columns was translated from integers to descriptive strings using the file `activity_labels.txt`.

lines 126-127 constructs the variable 'data_meanstd' which accomplishes steps 2-4 of the course assignment. it extracts from 'data' those columns that contain a means and std measurement. the firsth column is the subject, second column is the activity, and the rest of the columns are the data.

lines 132-142 constructs the variable tidydata_means' which accomplishes step 5 of the assignment. it contains the mean for each variable in step 4 for each subject and each activity.
