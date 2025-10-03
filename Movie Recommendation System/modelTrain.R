# modelTrain.R
# Train collaborative filtering model for movie recommendations

library(recommenderlab)

trainModel <- function(ratingMat) {
  model <- Recommender(ratingMat, method = "UBCF")
  return(model)
}
