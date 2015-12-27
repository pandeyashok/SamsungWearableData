# SamsungWearableData
This repo provides a R script that reads multiple files from the Human Activity Recognition Smartphone Dataset and obtains tidy data set for analysis. 


# Following steps were performed on the data to obtain a merged tidy data set.



 1. Install and load required r-packages

 2. Read the activity label

 3. Read features data

 4. Read subject from training data set and rename the columns

 5. Read the activity training dataset, replace the activity codes with activity labels

 6. Read the training dataset, apply meaningfule column names to all 561 columns

 7. Create a new column called 'observation_type' to identify all the records from training data set

 8. Merge data from multiple data frames into a single data frame called 'train.data'

 Now, load data the 'test' dataset
 9. Read the subject data

 10. Read the test activity data set, replace the activity codes to meaningful activity labels

 11. Read the test data, change the column names to meaningful names

 12. Create a new column called 'observation_type' to identify all the records from test data set

 13. Merge data from multiple data frames into a single data frame called 'test.data'

 14. Merge training dataset and test dataset into a single tidy data


 #  Code book describing the data variables

 https://github.com/pandeyashok/SamsungWearableData/blob/master/codebook.txt
 

