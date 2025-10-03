# modelPredict.R
# Predict sentiment using trained model

predictSentiment <- function(model, newData) {
  if (is.null(model)) stop("Model cannot be NULL")
  predictions <- predict(model, as.matrix(newData))
  return(predictions)
}
