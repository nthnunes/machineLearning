base <- read.csv("credit_risk.csv")

# install and import package with naive bayes resources
install.packages("e1071")
library(e1071)

# execute naive bayes algorithm
classifier <- naiveBayes(x = base[-5], y = base$risco)

# create a data frama with test infos
historia <- c("ruim")
divida <- c("alta")
garantia <- c("adequada")
renda <- c("0_15")
df <- data.frame(historia, divida, garantia, renda)

# execute a test
prediction <- predict(classifier, newdata = df, "raw")
print(prediction)