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
    
        Description of the variables in the dataset and cleaning procedures