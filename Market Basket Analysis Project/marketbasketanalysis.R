# marketbasketanalysis.R
# Entry point for Market Basket Analysis
# Performs association rule mining on transaction data

source("modelTrain.R")
source("modelPredict.R")

library(arules)

# Load transaction data
transactions <- read.transactions("transactions.csv", format = "basket", sep = ",")

# Train model
rules <- trainModel(transactions)

# Display top rules
inspect(head(rules, 10))
