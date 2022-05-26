base <- read.csv("credit_data.csv")
base$clientid <- NULL

base[base$age < 0 & !is.na(base$age), ]
base <- base[base$age > 0, 0]

mean(base$age[base$age > 0], na.rm = TRUE)
