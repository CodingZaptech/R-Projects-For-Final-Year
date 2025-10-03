# modelPredict.R
# Predict emotion from speech features

predictEmotion <- function(model, newData) {
  if (is.null(model)) stop("Model cannot be NULL")
  predictions <- predict(model, as.data.frame(newData))
  return(predictions)
}
