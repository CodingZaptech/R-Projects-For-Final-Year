# modelTrain.R
# Train machine learning model for Wine Quality Prediction
# Uses Random Forest Regressor

library(randomForest)

trainModel <- function(trainData) {
  if(!"quality" %in% colnames(trainData)){
    stop("Train data must contain 'quality' column")
  }
  model <- randomForest(quality ~ ., data = trainData, ntree = 100, importance = TRUE)
  print(model)
  return(model)
}
