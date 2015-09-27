#README
========

As follows the instructions for running correctly the R Script

* Read the Code Book to understand whats happening with the data set transformation
* Download and unzip the data set
* This script uses the data.table library version 1.9.6, is recommended if you  have have an lowest version upgrade it.

# Run the script
* library(data.set)
* source("run_analysis.R")
* DT<-run_analysis()

 The R script creates the "tidy_features.csv" file on the data folder, with te result of the excecution, as well as it returns it.
 
 
## Explaing the magic
The main function of the Script does the following

* Reads the training and test  data sets
* Merge the both data sets
* sub set the data sets, extracting the mean and std features 
* upadate the activiy with descriptive values
* Appropriately label the data set with descriptive variable names.
* From the treated data its creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Write the tidy data set into tidy_features.csv