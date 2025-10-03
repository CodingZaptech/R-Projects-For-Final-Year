# modelTrain.R
# Train a model to predict customer churn
# Random Forest classifier

library(randomForest)

trainModel <- function(trainData) {
  if(!"Churn" %in% colnames(trainData)){
    stop("Train data must contain 'Churn' column")
  }
  model <- randomForest(Churn ~ ., data = trainData, ntree = 100, importance = TRUE)
  print(model)
  return(model)
}
