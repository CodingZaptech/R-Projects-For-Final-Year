# modelPredict.R
# Predict movie recommendations for users

library(recommenderlab)

predictRecommendations <- function(model, ratingMat, n = 5) {
  recommendations <- predict(model, ratingMat, n = n)
  return(as(recommendations, "list"))
}
