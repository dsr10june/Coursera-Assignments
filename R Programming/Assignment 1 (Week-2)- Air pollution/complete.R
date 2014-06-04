complete <- function(directory, id = 1:332) {
  
  ##Set the directory (make R look into specdata folder)
  setwd(directory)
  
  ##Read all the files specified in the directory
  no_files <- list.files(path=getwd(), pattern=".csv")
  
  ##Access only those file specifed by user/function
  files <- lapply(no_files[id], read.csv)
  
  ##Stack the data into one data frame
  data <- do.call("rbind", files)
  
  ##Declare an empty data frame for the output
  output <- data.frame(id=NA, nobs=NA)[0,]
  
  ##Print the number of complete cases in each data file
  for (i in 1:length(id)){
    tempdata <- subset(data, ID == id[i])
    output[i,] <- c(id[i], sum(complete.cases(tempdata)))
  }
  
  output
  
}