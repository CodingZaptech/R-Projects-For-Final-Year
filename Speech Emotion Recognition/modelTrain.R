# modelTrain.R
# Train classifier for Speech Emotion Recognition

library(randomForest)

trainModel <- function(trainData, trainLabels) {
  model <- randomForest(as.data.frame(trainData), as.factor(trainLabels), ntree = 100)
  print(model)
  return(model)
}
