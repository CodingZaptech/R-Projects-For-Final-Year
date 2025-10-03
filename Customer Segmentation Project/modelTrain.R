# modelTrain.R
# Train K-Means clustering model for customer segmentation

trainModel <- function(data, centers = 3) {
  model <- kmeans(data, centers = centers, nstart = 25)
  print(model)
  return(model)
}
