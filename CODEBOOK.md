#Code Book for Course Project - Getting and Cleaning Data 


## Input Data: ##
**Location:** 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Description:** to be found in the unzipped data files:

- **README.txt**  for a start
* **features_info.txt**  summary information
* **features.txt** names of all variables of main data files (**X_test and Y_test**)

**Analysis**

Input data are splitted into 2 independent data sets. Locations are the **test and the train subdirectory**

**Statistics**

*test data file*    : **2947**  observations 

*training data file* : **7352** observations

*combined data file* : **10299** observations

*number variables / columns both for test and training data file*: **561**

*number of subjects:* **30** (unique value from subject_test and subject _train)

*number of possible activities per subject*: **6** (activity _labels and y_test, x_test)

**Logical Data Model from Analysis**

- Data files(DF): x_test, x_train
- Connection to meaning of colums / variables of DF: features (by position row# -> colum#)
- Connection of activity to DF: y_test, y_train (by position row# -> row#)
- Connection of subject to DF: subject_test, subject_train (by position row# -> row#)

# Output Data: #
- ***tidydata.csv**
- ***tidydatastat.txt**


**tidydata.csv, tidydatastat.txt** : comma separated files, with identying variables and data variables, contains combined rows of test and training data 


- Identifiers  : SubjectId -> Subject

- Identifiers  : ActivityName > Activity subject performs while measured (WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING, STANDING,LAYING)

- Data Variables Names: 
Variable Names from file features were taken, processed and used as column names.
Processing was limited to stripping away special characters:
e.g tBodyAcc-mean()-X was transformed to tBodyAccmeanX
The essence of the original variable name was preserved while errors for future processing were prevented


- Data Variables Names: Only colums where the variable name contains string *mean* or *std* where selected for the output files. This selection reduces data colums from 561 to 79.

Data Content:

- *tidydata.csv* original data from X (for selected colums)
- *tidydatastat.txt* processed data from tidydata.csv (mean by subjectId and ActivityName)

# Transformation: #

1. Combine Test and Train data (2947 rows + 7532 rows) -> 10299 rows in data frame X
1. Combine subject data and activity data into one data frame and use proper names
 (subcjectactivity (ActivityId,ActivityName,SubjectId) )
1. find the rownum of the names in features which contain character string "-std*" or "*-mean*" to be stored in vector index
1. create a new data frame selx which only contains the variables of interest (identified by index)
1. process the variables names identified by the vector index (stripping special characters) and store them in selfeatures
1. combine dataframe selx (selected data columns) with dataframe subjectactivity (identifier information, only subjectid and activity name selected)
1. output:  dataframe tidydata (SubjectID, ActivityNmae, all columns from selx
1. Convert dataframe tidydata  to dataframe and write file into working directory
1. Calculate mean by SubjectId, ActivityName and store it into data table tidystat
1. sort table tidystat and write it as file into working directory
1. Appropriately label the data set with descriptive variable names. 
