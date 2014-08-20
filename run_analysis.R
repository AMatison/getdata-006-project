##  run_analysis.R
# R script to process the data set for the course project into a summarised data file
# of the mean of the features aggregated by subject and activity type

# read in the features
features <- read.table(file("./features.txt"), stringsAsFactors = FALSE)
# filter out all but the mean() and std() features
features <- subset(features, grepl("mean\\(\\)|std",features$V2, fixed=FALSE))

# Read and merge the required files
# files containing the activity types
# y_train.txt
y_tr <- readLines(file("./train/y_train.txt"))
y_tr <- as.numeric(y_tr)
# y_test.txt
y_te <- readLines(file("./test/y_test.txt"))
y_te <- as.numeric(y_te)
# merge them
y_t <- append(y_tr, y_te)

# files containing the measurements
# X_train.txt
x_tr <- read.table(file("./train/X_train.txt"))
# filter out the unnecessary columns
x_tr <- x_tr[,features$V1]
# x_test.txt
x_te <- read.table(file("./test/X_test.txt"))
# filter out the unnecessary columns
x_te <- x_te[,features$V1]
# now merge them
x_t <- rbind(x_tr, x_te)

# files containing the subject numbers
# subject_train.txt
sub_tr <- as.numeric(readLines(file("./train/subject_train.txt")))
# subject_train.txt
sub_te <- as.numeric(readLines(file("./test/subject_test.txt")))
# now merge them and convert to a factor
sub_t <- factor(append(sub_tr, sub_te))

# read the activity labels
a_labels <- read.table(file("./activity_labels.txt"))
# create a activity labels factor
a_l <- a_labels$V2[y_t]

# bind it all into a single data frame, if needed
#full_df <- cbind(sub_t, a_l, x_t)

# aggregate the mean by subject and activity
tidy_df <- aggregate(x_t, by = list(sub_t,a_l), FUN = "mean")

# add the column names
names(tidy_df) <- c("Subject","Activity",features$V2)

# write out the simplified data to a text file
write.table(tidy_df, file = "./tidied_dataset.txt", row.names=FALSE)