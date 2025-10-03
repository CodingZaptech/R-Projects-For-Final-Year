# modelTrain.R
# Function to train a machine learning model for credit card fraud detection
# Uses Random Forest for classification

# Load necessary library
library(randomForest)

trainModel <- function(trainData) {
  # Check if the Class column exists
  if(!"Class" %in% colnames(trainData)){
    stop("Train data must contain 'Class' column")
  }

  # Train Random Forest model
  model <- randomForest(Class ~ ., data = trainData, ntree = 100, importance = TRUE)
  
  # Print model summary
  print(model)
  
  return(model)
}
