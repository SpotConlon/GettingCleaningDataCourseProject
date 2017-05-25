#Load Reshape2 package
library(reshape2)

#Load data sets

  #Load activity labels
  activity_labels <- read.table("~/Project_2_Data/UCI HAR Dataset/activity_labels.txt")

  #Load feature names
  features <- read.table("~/Project_2_Data/UCI HAR Dataset/features.txt")

  #Load training data sets
  X_train<- read.table("~/Project_2_Data/UCI HAR Dataset/train/X_train.txt")
  Y_train<- read.table("~/Project_2_Data/UCI HAR Dataset/train/Y_train.txt")
  subject_train <- read.table("~/Project_2_Data/UCI HAR Dataset/train/subject_train.txt")

  #Load testing data sets
  X_test<- read.table("~/Project_2_Data/UCI HAR Dataset/test/x_test.txt")
  Y_test<- read.table("~/Project_2_Data/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("~/Project_2_Data/UCI HAR Dataset/test/subject_test.txt")

#Cleanup column headers

  #Assign activity_labels column header
  names(activity_labels)[2]="activity"

  #Assign feature names (aka descriptive variable names) as column headers to training & testing data -> Item #4 in assignment
  names(X_train)=features$V2
  names(X_test)=features$V2
  
  #Rename the label file headers so it's clear they are activity codes
  names(Y_train)="activity"
  names(Y_test)="activity"

  #Assign ID header to subject data sets
  names(subject_train)="subjectID"
  names(subject_test)="subjectID"

#Merge data sets -> Item #1 in assignment
  
  train_data_merge <- cbind(subject_train,Y_train,X_train)
  test_data_merge <- cbind(subject_test,Y_test,X_test)
  merged_final <- rbind(train_data_merge,test_data_merge)
  
#Mean & Std Dev Extraction -> Item #2 in assignment
  
  tidy_1 <- merged_final[,grepl("subjectID|activity|mean|std",names(merged_final))]
  
#Assign/map activity codes to descriptive activity names -> Item #3 in assignment
  
  tidy_1$activity <- activity_labels$activity[match(tidy_1$activity,activity_labels$V1)]

#Create final tidy data set
  
  #Use reshape2 package to convert long to wide format via cast
  
    #Melt on subject  and activity
    tidy_2 <- melt(tidy_1,id.vars=c("subjectID","activity"))
    #Cast and aggregate using mean
    tidy_final <- dcast(tidy_2,subjectID + activity ~ variable,fun.aggregate=mean,na.rm=TRUE)
