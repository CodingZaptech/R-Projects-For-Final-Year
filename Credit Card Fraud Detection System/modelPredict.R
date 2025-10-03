# modelPredict.R
# Function to predict credit card fraud on new data using the trained model

predictFraud <- function(model, newData) {
  # Check if model is valid
  if (is.null(model)) {
    stop("Model cannot be NULL")
  }
  
  # Predict using the trained model
  predictions <- predict(model, newData)
  
  return(predictions)
}
