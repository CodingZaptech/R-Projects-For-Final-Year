# modelPredict.R
# Predict customer segments using trained K-Means model

predictSegment <- function(model, data) {
  if (is.null(model)) stop("Model cannot be NULL")
  clusters <- model$cluster
  return(clusters)
}
