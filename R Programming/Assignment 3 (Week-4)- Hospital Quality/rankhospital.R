rankhospital <- function( state, outcome, num){
  
  ##Read the file from the data set
  data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  
  #Variable for state/num validity and assigning worst part
  totalStates <- sum(data["State"] == state)
  
  ##Check the state for validity
  if (totalStates == 0) {
    ##Stop the execution
    stop("Invalid state")
  }
  
  ##Check the outcome for Validity
  if ((outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia") == FALSE) {
    ##Stop the execution
    stop("Invalid outcome")
  }
  
  #Return the hospital names with specified num
  if (outcome == "heart attack"){
    outdata <- subset(data, State == state)
    orderedResult <- order(as.numeric(outdata[,11]), outdata$Hospital.Name, na.last=NA)
  }else if (outcome == "heart failure"){
    outdata <- subset(data, State == state)
    orderedResult <- order(as.numeric(outdata[,17]), outdata$Hospital.Name, na.last=NA)
  }else {
    outdata <- subset(data, State == state)
    orderedResult <- order(as.numeric(outdata[,23]), outdata$Hospital.Name, na.last=NA)
  }
  
  if(num == "best"){
    num <- 1
  }else if(num == "worst"){
    num <- length(orderedResult)
  }
  
  as.character(outdata$Hospital.Name[orderedResult[num]])
  
  ##Check the num for validity
  if (totalStates < num) {
    ##Stop the execution
    s <- "NA"
  }
  
}