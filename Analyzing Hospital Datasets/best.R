best <- function(state, outcome) {
data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")  
states <- unique(data$State)
outcomes <- c("heart attack", "heart failure", "pneumonia")
  
if (!(state %in% states)) {
  stop("invalid state")
}
  
if (!(outcome %in% outcomes)) {
  stop("invalid outcome")
}
  
d2 <- data[data$State == state, ]
d2[, c(11, 17, 23)] <- sapply(d2[, c(11, 17, 23)], as.numeric)
d2 <- d2[order(d2[, 2]), ] #arrange the hospital names also solves the case for same values as they are arranged in alphabetical order
  
if (outcome == "heart attack") {
  best <- d2[which.min(d2[, 11]), "Hospital.Name"]
}
else if (outcome == "heart failure") {
  best <- d2[which.min(d2[, 17]), "Hospital.Name"]
}
else {
  best <- d2[which.min(d2[, 23]), "Hospital.Name"]
}
  
best
}