# Code for obtaining tidy data set from Samsung wearable smartphone Data Set    

# install and load required packages
install.packages("dplyr")

library(dplyr)
library(data.table)

# Read activity label
activity <- read.table("./activity_labels.txt")

# Read features data
features <- read.table("./features.txt")

# Read subject from training data set and rename the column
subject_train <- read.table("./train/subject_train.txt")
subject_train <- rename(subject_train, subject=V1)

# Read the activity training dataset, replace the activity codes with activity labels
y_train <- read.table("./train/y_train.txt")
y_train <- activity[match(y_train$V1, activity$V1), 2, drop=F]
y_train <- rename(y_train, activity=V2)

# Read the training dataset, apply meaningfule column names to all 561 columns
x_train <- read.table("./train/x_train.txt")
colnames(x_train) <- features[,"V2"]

# Create a new column called 'observation_type' to identify all the records from training data set
observation_type <- data.frame(1:nrow(x_train),"train")
colnames(observation_type) <- c("", "observation_type")

# Merge data from multiple data frames into a single data frame called 'train.data'
train.data <- cbind(observation_type[,2],subject_train)
colnames(train.data)[1] <- "observation_type"
train.data <- cbind(train.data, y_train)
train.data <- cbind(train.data, x_train)



# Now, load data the test dataset
# Read the subject data
subject_test <- read.table("./test/subject_test.txt")
subject_test <- rename(subject_test, subject=V1)

# Read the test activity data set, replace the activity codes to meaningful activity labels
y_test <- read.table("./test/y_test.txt")
y_test <- activity[match(y_test$V1, activity$V1), 2, drop=F]
y_test <- rename(y_test, activity=V2)

# Read the test data, change the column names to meaningful names
x_test <- read.table("./test/x_test.txt")
colnames(x_test) <- features[,"V2"]

# Create a new column called 'observation_type' to identify all the records from test data set
observation_type <- data.frame(1:nrow(x_test),"test")
colnames(observation_type) <- c("", "observation_type")

# Merge data from multiple data frames into a single data frame called 'test.data'
test.data <- cbind(observation_type[,2],subject_test)
colnames(test.data)[1] <- "observation_type"
test.data <- cbind(test.data, y_test)
test.data <- cbind(test.data, x_test)

# Merge training dataset and test dataset into a single tidy data
tidy.data <- rbind(train.dat,test.dat)



# Write the tidy data into a file called 'tidy_data.txt', row names suppressed
write.table(tidy.data, "./tidy_data.txt", sep="\t", row.names=FALSE) 