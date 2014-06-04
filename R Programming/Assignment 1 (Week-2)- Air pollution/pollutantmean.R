pollutantmean <- function (directory, pollutant, id = 1:332) {
  
  ##Set the directory (make R look into specdata folder)
  setwd(directory)
  
  ##Read all the files specified in the directory
  no_files <- list.files(path=getwd(), pattern=".csv")
  
  ##Access only those file specifed by user/function
  files <- lapply(no_files[id], read.csv)
  
  ##Stack the data into one data frame
  data <- do.call("rbind", files)
  
  ##Calculate the mean of the pollutnt specified
  pollutantname <- data[pollutant]
  mean_pollutant <- mean(pollutantname[!is.na(pollutantname)])
  
  ##Go back to the previous directory (Optional)
  ##setwd("../")
  
  ##Print the mean to the console
  mean_pollutant
  
}
