rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[c(2, 7, 11, 17, 23)]
  data[, c(3, 4, 5)] <- sapply(data[, c(3, 4, 5)], as.numeric)
  states <- unique(data$State)
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(state %in% states)) {
    stop("invalid state")
  }
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  d2 <- data[data$State == state, ]
  
  if (outcome == "heart attack") {
    d2 <- d2[order(d2[, 3], d2[, 1]), ]
    d2 <- d2[!is.na(d2[, 3]), ]
  }
  else if (outcome == "heart failure") {
    d2 <- d2[order(d2[, 4], d2[, 1]), ]
    d2 <- d2[!is.na(d2[, 4]), ]
  }
  else {
    d2 <- d2[order(d2[, 5], d2[, 1]), ]
    d2 <- d2[!is.na(d2[, 5]), ]
  }
  
  if (num == "best") {
    num <- 1L
  }  
  else if (num == "worst") {
    num <- nrow(d2)
  }
  else {
    num <- as.numeric(num)
  }
  
  d2[num, 1]
}
