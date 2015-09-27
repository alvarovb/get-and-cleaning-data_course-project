##
#  This R script has been made entirely for academic purpose using the data set 
#  from  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#  which record the Human Activity Recognition Using Smartphones. The output of
#  this script is a tidy data set using only the mean and sd features described
#  on the features.txt file.
#
#  This script uses the data.table library version 1.9.6, is recommended if you 
#  have have a lowest version upgrade it.
#
#  Author: Alvaro Viloria   
#

##
#  Read the following files, and merge them into one data.table:
#  * subject_<train|test>.txt
#  * y_<train|test>.txt
#  * X_<train|test>.txt
#
read_data_files <- function(basedir="UCI HAR Dataset", dataset = "test") {
    path <- paste(basedir,"/", dataset, "/", sep="")
   
    xData = "X_test.txt"; subject <- "subject_test.txt"; action <- "y_test.txt"
    
    if(dataset == "train") {
        xData <- "X_train.txt"
        subject <- "subject_train.txt"
        action <- "y_train.txt"
    } 
    #Reading x-file
    DT <- fread(paste(path,xData, sep =""))
    #Reading subject file
    sub <- fread(paste(path,subject, sep =""))
    
    #Reading action file and binding it to subject
    sub <- cbind(sub,action = fread(paste(path,action, sep ="")))
    
    #Binding
    DT <- cbind(subj = sub, DT)
} 

##
# Method that return from the data set the subject, action, and the mean and sd variables 
#
get_subset <- function(DT){
    
   DT<-DT[,.SD,.SDcols=c("subj.V1","subj.action.V1","V1","V2","V3","V4","V5","V6","V41","V42",
                         "V43","V44","V45","V46","V81","V82","V83","V84","V85",
                         "V86","V121","V122","V123","V124","V125","V126","V161",
                         "V162","V163","V164","V165","V166","V201","V202","V214",
                         "V215","V227","V228","V240","V241","V253","V254","V266",
                         "V267","V268","V269","V270","V271","V345","V346","V347",
                         "V348","V349","V350","V424","V425","V426","V427","V428",
                         "V429","V503","V504","V516","V517","V529","V530","V542",
                         "V543")]

}

##
#  Method that renames the columns of reduced data set
#
rename_dataset <- function(DT){
    setnames(DT, c("subject", "action","tBodyAcc-mean-X", "tBodyAcc-mean-Y", "tBodyAcc-mean-Z", 
                   "tBodyAcc-std-X", "tBodyAcc-std-Y", "tBodyAcc-std-Z", 
                   "tGravityAcc-mean-X", "tGravityAcc-mean-Y", "tGravityAcc-mean-Z", 
                   "tGravityAcc-std-X",    "tGravityAcc-std-Y", "tGravityAcc-std-Z",
                   "tBodyAccJerk-mean-X", "tBodyAccJerk-mean-Y", "tBodyAccJerk-mean-Z",
                   "tBodyAccJerk-std-X", "tBodyAccJerk-std-Y", "tBodyAccJerk-std-Z", 
                   "tBodyGyro-mean-X", "tBodyGyro-mean-Y", "tBodyGyro-mean-Z", 
                   "tBodyGyro-std-X", "tBodyGyro-std-Y", "tBodyGyro-std-Z", 
                   "tBodyGyroJerk-mean-X", "tBodyGyroJerk-mean-Y", "tBodyGyroJerk-mean-Z", 
                   "tBodyGyroJerk-std-X", "tBodyGyroJerk-std-Y", "tBodyGyroJerk-std-Z", 
                   "tBodyAccMag-mean", "tBodyAccMag-std", "tGravityAccMag-mean", 
                   "tGravityAccMag-std", "tBodyAccJerkMag-mean", "tBodyAccJerkMag-std",
                   "tBodyGyroMag-mean", "tBodyGyroMag-std", "tBodyGyroJerkMag-mean", 
                   "tBodyGyroJerkMag-std", "fBodyAcc-mean-X", "fBodyAcc-mean-Y", 
                   "fBodyAcc-mean-Z", "fBodyAcc-std-X", "fBodyAcc-std-Y", "fBodyAcc-std-Z", 
                   "fBodyAccJerk-mean-X", "fBodyAccJerk-mean-Y", "fBodyAccJerk-mean-Z", 
                   "fBodyAccJerk-std-X", "fBodyAccJerk-std-Y", "fBodyAccJerk-std-Z", 
                   "fBodyGyro-mean-X", "fBodyGyro-mean-Y", "fBodyGyro-mean-Z", 
                   "fBodyGyro-std-X", "fBodyGyro-std-Y", "fBodyGyro-std-Z", 
                   "fBodyAccMag-mean", "fBodyAccMag-std", "fBodyBodyAccJerkMag-mean", 
                   "fBodyBodyAccJerkMag-std", "fBodyBodyGyroMag-mean", "fBodyBodyGyroMag-std",
                   "fBodyBodyGyroJerkMag-mean", "fBodyBodyGyroJerkMag-std"))
}


## 
#  This is the main function of run_analysis.R, you shall not worry about
#  nothing else besied of having the correct data set downloaded, and unzipped
#  on the UCI HAR Datase folder.
#
#  Expected outputs:
#    * Tidy Data extracted from training and test data sets
#    * Csv file, with the tidy data named: tidy_features.csv on data folder.
run_analysis <- function() {
    library(data.table)
    dataTest <- read_data_files(basedir="UCI HAR Dataset", dataset = "test")
    dataTrain <- read_data_files(basedir="UCI HAR Dataset", dataset = "train")
    
    #Part 1: Merge the two data sets
    data_merged <- rbind(dataTest,dataTrain)
    
    #Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
    data_merged <- get_subset(data_merged)
    
    
    #Part 3: Uses descriptive activity names to name the activities in the data set
    #dt[, col2 := as.character(col2)][col2 == "1", col2 := "bigDog"]
    data_merged$subj.action.V1[data_merged$subj.action.V1 == 1]<-"WALKING"
    data_merged$subj.action.V1[data_merged$subj.action.V1 == 2]<-"WALKING_UPSTAIRS" 
    data_merged$subj.action.V1[data_merged$subj.action.V1 == 3]<-"WALKING_DOWNSTAIRS"
    data_merged$subj.action.V1[data_merged$subj.action.V1 == 4]<-"SITTING"
    data_merged$subj.action.V1[data_merged$subj.action.V1 == 5]<-"STANDING" 
    data_merged$subj.action.V1[data_merged$subj.action.V1 == 6]<-"LAYING"
                      
    #Part 4: Appropriately labels the data set with descriptive variable names. 
    data_merged <- rename_dataset(data_merged)
    data_merged <- data_merged[order(subject, action)]
    
    #Part 5: From the data set in step 4, creates a second, independent 
    # tidy data set with the average of each variable for each activity and each subject.
    data_merged<-data_merged[, lapply(.SD,mean), by=.(subject, action), .SDcols=-(c("subject", "action"))]
    
    #Part 6: Write the tidy data set into tidy_features.csv
    if(!file.exists("./data")) {dir.create("./data")}
    write.table(data_merged, file = "./data/tidy_features.csv", sep=",", row.name=FALSE)
    
    ## Returning tidy data set
    data_merged
    
}
