# GettingCleaningDataAssignment
*François de BELLEFON's final assignment to the Coursera's course "Getting and Cleaning Data".*

##Input
This script takes into input files from the following adress : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.


##Extracting data files

###Common data
We first extract datas that are common to both "train" and "test" datasets :
* features names fromt the "features" file. Some are redundant, so we make them unique, by using the "make.unique" function, which adds sequence numbers to duplicates.
* Transcodification table for activities (1 -> Walking, 2 -> Standing...) from the "activity_labels" file.

###Train and Test sets
For each data set (train and test), we get :
* Subjects
* Y values (which refers to activities)
* X values, and name its columns with the unique features names.


###Merging the values
Then, for each X values, we add two columns :
* The subjects
* The activities names, that we got from a transcodification from the Y values with the "activity_labels".

Then, we bind the two datasets together.


###Substracting Means and Standard Deviations
We then only want to keep the "identifying variables" (subject, activity), and the "mean" and "Standard Deviation" variables.
For that, we only keep the columns name that end with "mean()" or "std()".

###Averaging means and standard deviations
We then average the means and standard deviations for each subject and activity.
