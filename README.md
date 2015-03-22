# run_analysis

### Data and purpose of script.
The data used in this script can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Once the data are downloaded and unzipped in the working directory, the script does some tidying for further 
analysis:
* It assigns descriptive variable names (and doing this it removes some special character to improve
   readability)
* Merges the data frames containing information about subject id and the name of the activity
   performed and the data frame containing all measuraments of the variables.

In the raw data downloaded the measurements are divided into 2 data frames called "X_train.txt" and "X_test.txt".
After the the tidying performed on each of this 2 data sets (as described previously), the 2 data sets are merged into
one data sets called "merged". 

Then the script subsets the "merged" data set into a new data set (called "mean.std.df")
containing only the measurements on the mean and standard deviation for each measurement. 

Finally the script creates and writes on a txt file called "average_by_subject_and_activity.txt"  a data set
containing the average of each variable for each activity and each subject. This data set is arranged in 
ascending order by subject id and activity name.

NOTE:
*For further information about variable names INSIDE the data set and their meaning check the readme files contained in the original data.
*For more info about variables used in the script check the CodeBook file in this repo

