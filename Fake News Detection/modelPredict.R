# modelPredict.R
# Predict Fake News using trained model

predictFakeNews <- function(model, newData) {
  if (is.null(model)) stop("Model cannot be NULL")
  predictions <- predict(model, as.matrix(newData))
  return(predictions)
}
