cleaningData
============

This repo contains two files

 1. run_analysis.R
        
    R script that merges and cleans motion sensor data
        
      * The "UCI HAR Dataset" folder needs to be in the R work directory
      * Run the script by sourcing it: source("run_analysis.R")
      * Produces a tidy dataset in "data.txt"
      * Leaves the cleaned data before (data) and after (aggdata) averaging in the R environment
      * Read the dataset into R by: read.table("data.txt", header = TRUE)

 2. CodeBook.md
    
    Description of the variables in the dataset
    
The data cleaning process is described as follows

 1. Read subject labels, sensor signal data, and activity labels into R with read.table for both the training and test datasets
 2. Column bind the subject labels and the activity labels onto the sensor signal data
 3. Row bind the training and test datasets together to get the main data.frame
 4. Read the original column (feature) names, convert them into legal R names, and assign the column names
 5. Select the mean and std pairs with string matching
 6. The activity labels are changed to descriptive names by converting the column into a factor
 7. The column names are cleaned up. Three consecutive dots are replaced with one. Repeating 'Body' in the names are corrected. Trailing dots are deleted.
 8. Auxillary data that are no longer useful are removed
 9. Use aggregate function to calculate the mean of each subject and each activity
10. Write output file