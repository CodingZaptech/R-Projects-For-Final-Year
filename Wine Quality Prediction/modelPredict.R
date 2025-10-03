# modelPredict.R
# Function to predict wine quality on new data

predictQuality <- function(model, newData) {
  if (is.null(model)) stop("Model cannot be NULL")
  predictions <- predict(model, newData)
  return(predictions)
}
