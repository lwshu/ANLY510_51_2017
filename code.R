setwd("D:/2017 summer/Principle 2/team project2")
data <- read.csv('dirty_data.csv', na.strings=c("NA","NaN", ""))

## Populate the missing values in the Area variable

na.lomf <- function(x) {
  
  na.lomf.0 <- function(x) {
    non.na.idx <- which(!is.na(x))
    if (is.na(x[1L])) {
      non.na.idx <- c(1L, non.na.idx)
    }
    rep.int(x[non.na.idx], diff(c(non.na.idx, length(x) + 1L)))
  }
  
  dim.len <- length(dim(x))
  
  if (dim.len == 0L) {
    na.lomf.0(x)
  } else {
    apply(x, dim.len, na.lomf.0)
  }
}

data$Area <- na.lomf(data$Area)

## Remove special characters, padding from Street 1 and Street 2 variables
data$Street <- gsub("[^0-9A-Za-z///' ]"," ", data$Street)


## Remove the "Strange HTML column"
data <- data[, !(names(data) %in% c('Strange.HTML'))]

## output
write.csv(data, 'clean_data.csv')