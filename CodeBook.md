# Getting and Cleaning Data Assignment CodeBook
This CodeBook is aimed to explain all the variables given in the submitted Data Set.

All these variables are obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and extracted / transformed with the run_analysis.R script (the README.md file explains its steps).


The submitted Data Set has the following variables :

## Identifying variables : 
These allow to identify a measurement by its Subject and its Activity. They are :
* Activity : shows the activity which was performed for this measurement.
* Subject : the subject on which was performed the measurement.


## Measurement Variables
These variables are means of Means and Standard Deviations of Accelerations and Angular velocities.

### Note
All the measurements are normalized and bounded within [-1,1]


### Units
Used units are : 
* Acceleration measures :  standard gravity units 'g'.
* Angular velocities : radians/second. 

### Variable names
Measurement variable names follow this codification, in the following order :

#### First letter : 
* **t** : Indicates these are Time Domain Signal.
* **f** : indicates a Fast Fourier Transformation has been applied. 


#### Body or gravity acceleration : 
* **Body** : Refers to a Body Acceleration Signal -  obtained by subtracting the gravity from the total acceleration. 
* **Grativy** : Refers to a Gravity Acceleration Signal


### Linear or angular acceleration :
* **Acc** : Refers to a linear acceleration
* **Gyro** : Refers to an angular velocity.


### Optional indications if this is a jerk signal, the magnitude of a signal, both, or none :
* **Jerk** : Derived from the Body Linear acceleration.
* **Mag** : Magnitude of the signal
* **JerkMag** : Magnitude of the Jerk signak
* ** *(nothing)* ** : none of the above


### Direction of the 3-axial signal :
* **Letter** : X, Y, Y : Indicates the direction of the 3-axial signal.


### mean or std : indicates if the variable is a mean or a standard deviation.
* **mean()** : variable is a mean
* **std()** : variable is a standard deviation
