# modelTrain.R
# Train association rules model using Apriori algorithm

library(arules)

trainModel <- function(transactions) {
  rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.5))
  return(rules)
}
