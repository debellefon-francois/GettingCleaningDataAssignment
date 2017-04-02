#We will use the library dlpyr :
library(dplyr)

#We set the working directory :
path2folder <- #Masked for the GitHub submission - gives information to my personal workspace
setwd(path2folder)


#Get the features names. Some are redundant, so we make them unique, by using the "make.unique" function, which adds sequence numbers to duplicates.
features <- read.table("features.txt", sep = "")[,2] %>% as.character() %>% make.unique()


#Get the activity labels (walking, standing...)
activity_labels <- read.table("activity_labels.txt")

#Get the "y" values for the "train" and "test" sets - which refers to activity codes
y_train <- read.table("./train/y_train.txt",encoding = "Unicode")
y_test <- read.table("./test/y_test.txt",encoding = "Unicode") 


#Get the subjects for each data set
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")


#Get the "x" values for each set. We merge them with the "subjects" and the "activities". We use the feature names as column names. Also, we make the choice of the "wide format" - one observation (activity / subject / features) per line 
X_train <- read.table("./train/X_train.txt",col.names = features,check.names=FALSE) %>%   mutate(subject = subject_train$V1, activity = vapply(y_train$V1,FUN = function(x) as.character(activity_labels$V2[activity_labels$V1 == x]),c("a"))) 
X_test <- read.table("./test/X_test.txt",col.names = features,check.names=FALSE) %>% mutate(subject = subject_test$V1,activity = vapply(y_test$V1,FUN = function(x) as.character(activity_labels$V2[activity_labels$V1 == x]),c("a")))
#Merge the two datasets :
Binded <- rbind(X_train,X_test)


#Select all the colums whose names end with mean() or std()
ExtractedMeansStd <- select(Binded,subject,activity,c(grep("mean\\(\\)|std\\(\\)",names(Binded),ignore.case=TRUE)))

#Calculate the mean of "means" and "standard deviation" for each subject and activity :
Result <- group_by(ExtractedMeansStd,subject,activity) %>%
summarise_all(mean) %>%
 unclass() %>% data.frame(check.names=FALSE)