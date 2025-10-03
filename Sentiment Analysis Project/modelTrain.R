# modelTrain.R
# Train sentiment analysis model using Naive Bayes

library(e1071)

trainModel <- function(trainData, trainLabels) {
  model <- naiveBayes(as.matrix(trainData), as.factor(trainLabels))
  print(model)
  return(model)
}
