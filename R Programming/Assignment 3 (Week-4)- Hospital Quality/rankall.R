rankall <- function(outcome, num="best"){
  
  ##Read the file from the data set
  data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  
  ##Check the outcome for Validity
  if ((outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia") == FALSE) {
    ##Stop the execution
    stop("Invalid outcome")
  }
  
  ##Order the data
  #Return the hospital names with specified num
  if (outcome == "heart attack"){
    
    orderedResult <- order(data["State"], as.numeric(data[,11]), data$Hospital.Name, na.last=NA)
    ##Data according to the ordered states
    orderData <- data[orderedResult,] 
    
  }else if (outcome == "heart failure"){
    
    orderedResult <- order(data["State"], as.numeric(data[,17]), data$Hospital.Name, na.last=NA)
    ##Data according to the ordered states
    orderData <- data[orderedResult,]
  
  }else {
    
    orderedResult <- order(data["State"], as.numeric(data[,23]), data$Hospital.Name, na.last=NA)
    ##Data according to the ordered states
    orderData <- data[orderedResult,]
    
  }
  
  ##Split the data according to the the states
  split_data <- split(orderData, orderData$State)
  
  #Declare the data frame for the output
  hospname <- data.frame(hospital=NA, state=NA)[]
  
  if(num == "best"){
    num <- 1
  }else if(num == "worst"){
    num <- length(split_data)
  }
  
  ##Check the num for validity
  if (length(split_data) < num) {
    ##Stop the execution
    stop("NA")
  }
  
  for (i in 1:length(split_data)){
    hospname[i,] <- c(split_data[[i]][num,"Hospital.Name"],split_data[[i]][1,"State"])
  }
  
  hospname
  
}