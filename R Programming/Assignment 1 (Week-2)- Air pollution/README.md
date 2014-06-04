### Introduction

For this first programming assignment we had to write three functions
that are meant to interact with dataset that accompanies this assignment.
These are the instructions given by the coursera.

### Part 1 (pollutantmean)

Write a function named 'pollutantmean' that calculates the mean of a pollutant
(sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean'
takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
'pollutantmean' reads that monitors' particulate matter data from the directory specified in 
the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
ignoring any missing values coded as NA.Please save your code to a file named pollutantmean.R.

### Part 2 (complete)

Write a function that reads a directory full of files and reports the number of completely
observed cases in each data file. The function should return a data frame where the first 
column is the name of the file and the second column is the number of complete cases.
Please save your code to a file named complete.R.

### Part 3 (corr)

Write a function that takes a directory of data files and a threshold for complete cases and
calculates the correlation between sulfate and nitrate for monitor locations where the number
of completely observed cases (on all variables) is greater than the threshold. The function 
should return a vector of correlations for the monitors that meet the threshold requirement.
If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
For this function you will need to use the 'cor' function in R which calculates the correlation between two vectors.
Please save your code to a file named corr.R