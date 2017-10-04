#This R file is created this assignment

data1 = read.csv("C:/Users/JHA/Google Drive/HU/Analy II/week 13 - in class/ANLY510_51_2017/dirty_data.csv", header = T, na.strings = c("", "NA"))
summary(data1)

## Populate missing data in Area variable
library("mice")

vardata1 <- as.data.frame(data1)
summary(vardata1)
md.pattern(vardata1)

tempData <- mice(vardata1[1:3],m=5,maxit=5000,meth='polyreg',seed=5000)
data_new1 = complete(tempData)
summary(data_new1)
head(data_new1)
#tempData
#data_new1
