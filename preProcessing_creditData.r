# save csv in var base
base <- read.csv("credit_data.csv")

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

View(base)