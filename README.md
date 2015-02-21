#  README.md  #

describes the content of Repository **"gettingandcleaningdata"** 

This reposotory     "gettingandcleaningdata" contains the following files:

-  **README.md**       the file you are reading
-  **CodeBook.md**       description of input, output and transformation used 
-  **run_analysis.R**    script to transform input to output 
-  **tidydatastat.txt**  summary result file: contains the mean by subject and activity for all selected mean and std variables from the original file.


*run_analysis.R*, the script ,downloads the zipped data into /data/ subdirectory of your working directory

it unzipps the zipped files and produces the tidy data set: 

* tidydata.csv      ,which contains selected columns of the original data (means and standard deviations)

* tidydatastat.txt  Mean statistics of tidydata.csv: Mean by subject and activityname

To run run_analysis.R  copy/past it into your rstudio editor, select all code lines and run the selected code.

To clean up after you run run_analysis.R delete subdirectory /data/

**run_analysis.R** uses packages **dplyr**, **data.table**

