corr <- function(directory, threshold = 0) {
  
  ##Set the directory (make R look into specdata folder)
  setwd(directory)
  
  ##Either Check for the complete cases with complete.R
  ##cases <- complete(directory, 1:10)
  
  #OR Write the code here
  ##Read all the files specified in the directory
  no_files <- list.files(path=getwd(), pattern=".csv")
  
  ##Access only those file specifed by user/function
  files <- lapply(no_files, read.csv)
  
  ##Stack the data into one data frame
  data <- do.call("rbind", files)
  
  ##Declare an empty data frame for the output
  output <- data.frame(id=NA, nobs=NA)[0,]
  
  ##Calculate the correlation
  id=1:332
  correlation <- vector()
  k=1
  for (i in 1:length(id)){
    tempdata <- subset(data, ID == id[i])
    cases <- sum(complete.cases(tempdata))
    if (cases > threshold){
      correlation[k] <- cor(tempdata[,2],tempdata[,3], use="complete")
      k=k+1
    }
  }
  
  ##Go back to the previous directory
  ##setwd("../")
  
  correlation
  
}