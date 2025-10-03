# movierecommendationsystem.R
# Entry point for Movie Recommendation System
# Uses collaborative filtering for recommendations

source("modelTrain.R")
source("modelPredict.R")

library(recommenderlab)

# Load dataset
data <- read.csv("movies.csv")

# Convert to rating matrix
ratingMat <- as(as.matrix(data), "realRatingMatrix")

# Train recommendation model
model <- trainModel(ratingMat)

# Predict top 5 recommendations for first 10 users
recommendations <- predictRecommendations(model, ratingMat, n = 5)
print(recommendations)
