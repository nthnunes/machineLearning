# save csv in var base
base <- read.csv("resources/credit_data.csv")

# delete clientid column
base$clientid <- NULL

# check negative ages
base[base$age < 0 & !is.na(base$age), ]

# delete negative ages
base <- base[base$age > 0, ]

# check and delete null ages
base[is.na(base$age), ]
base <- base[!is.na(base$age), ]

# create a standard of values
base[, 1:3] <- scale(base[, 1:3])

# package with some tools of machine learning
library(caTools)
set.seed(1)

# split data to learning and test
division <- sample.split(base$default, SplitRatio = 0.75)

# set training and test data
training <- subset(base, division == TRUE)
test <- subset(base, division == FALSE)

# import package with naive bayes resources
library(e1071)

# execute naive bayes algorithm
classifier <- naiveBayes(x = training[-4], y = test$default)
print(classifier)


View(base)