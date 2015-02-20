# README.md describes the content of Repository "gettingandcleaningdata" 

This repsoitory     "gettingandcleaningdata" countains the following files:
* README.md         the file you are reading
* CodeBook.md       description of input, output and transformation used 
* run_analysis.R    script to transform input to output 
* tidydatastat.txt  summarry result file: contains the mean by subject and activity for all 
                    selected mean and std variables from the original file.


* run_analysis.R    this script downloads the zipped data into /data/ subdirectory of your working directory
                  it unzipped the files and produces the tidy data set: 
* tidydata.csv      ,which contains selected columns of the original data (means and standard deviations)

* tidydatastat.txt  Mean statistics of tidydata.csv: Mean by subject and activityname

To run run_analysis.R  copy/past into your rstudio editor, select code and run seleected code.
                  To clean up after you run run_analysis.R delete subdirectory /data/