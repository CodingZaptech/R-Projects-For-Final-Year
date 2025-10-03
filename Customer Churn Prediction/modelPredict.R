# modelPredict.R
# Function to predict customer churn

predictChurn <- function(model, newData) {
  if (is.null(model)) stop("Model cannot be NULL")
  predictions <- predict(model, newData)
  return(predictions)
}
