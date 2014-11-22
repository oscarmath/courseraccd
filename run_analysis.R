# The data linked were collected from the accelerometers on the Samsung Galaxy S smartphone.  
# The data is downloaded from the follwing website
# http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The analysis uses the dplyr package
library(dplyr)

# get the file url and document when this occurs.
today = as.Date(Sys.time())
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# create a temporary directory
td = tempdir()

# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")
# download into the placeholder file
download.file(fileUrl, tf)

# get the names of the relevant files in the zip archive
fnames = unzip(tf, list=TRUE)


# extract file 2 from archive: features.txt
# get the name of file 2
fname = fnames$Name[2]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
features = read.table(fpath, stringsAsFactors=FALSE)

# extract file 16 from archive: subject_test.txt
# get the name of file 16
fname = fnames$Name[16]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
subject_test = read.table(fpath, stringsAsFactors=FALSE)

# extract file 17 from archive: X_test.txt
# get the name of file 17
fname = fnames$Name[17]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
X_test = read.table(fpath, stringsAsFactors=FALSE)

# extract file 18 from archive: y_test.txt
# get the name of file 18
fname = fnames$Name[18]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
y_test = read.table(fpath, stringsAsFactors=FALSE)

# extract file 30 from archive: subject_train.txt
# get the name of file 30
fname = fnames$Name[30]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
subject_train = read.table(fpath, stringsAsFactors=FALSE)

# extract file 31 from archive: X_train.txt
# get the name of file 31
fname = fnames$Name[31]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
X_train = read.table(fpath, stringsAsFactors=FALSE)

# extract file 32 from archive: y_train.txt
# get the name of file 32
fname = fnames$Name[32]
# unzip the files to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
# read in data into R
y_train = read.table(fpath, stringsAsFactors=FALSE)


# delete temporary files and directories used in reading in data
unlink(tf)
unlink(td)


# rename the columns of X_train and X_test with features
names(X_train) <- features[,2]
names(X_test) <- features[,2]

# rbind the train and test data
X_total <- rbind(X_train, X_test)
subject_total <- rbind(subject_train, subject_test)
y_total <- rbind(y_train, y_test)

# Use descriptive names in the y_total and subject_total data frames
activity_names <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
activity_vec <- character()
for (i in 1:length(y_total$V1)) {
  activity_vec <- c(activity_vec, activity_names[y_total$V1[i]])
}
activity <- data.frame(activity = activity_vec)
names(subject_total) <- c("subject_id")


# cbind the _total data frames to make one data frame using descriptive names for activities
data <- cbind(subject_total, activity, X_total)
# we also make the the column names unique
names(data) <- make.names(names(data), unique = TRUE)


# Extract only the measurements on the mean and standard deviation for each measurement. 
data_meanstd <- select(data, contains("mean"), contains("std"))
data_meanstd <- cbind(subject_total, activity, data_meanstd)


# create a second, independent tidy data set from data_meanstd with the average of each 
# variable for each activity and each subject.
tidydata_means <- data.frame()
for (i in 1:30){
  for (act in activity_names){
      col <- colMeans(select(filter(data_meanstd, subject_id == i, activity == act), -(subject_id:activity)))
      df <- data.frame()
      df <- rbind(col)
      df <- cbind(c(i), c(act), df)
      tidydata_means <- rbind(tidydata_means, df)
  }
}
names(tidydata_means) <- names(data_meanstd)

