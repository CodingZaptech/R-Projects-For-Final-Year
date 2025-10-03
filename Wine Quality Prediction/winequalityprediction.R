# winequalityprediction.R
# Entry point for Wine Quality Prediction
# Loads data, trains the model, and predicts wine quality

source("modelTrain.R")
source("modelPredict.R")

# Load dataset
data <- read.csv("winequality.csv")

# Split dataset into training and testing sets
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.7 * nrow(data))
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Train the model
model <- trainModel(trainData)

# Predict on test data
predictions <- predictQuality(model, testData)

# Evaluate model accuracy
mae <- mean(abs(predictions - testData$quality))
cat("Mean Absolute Error (MAE):", round(mae, 2), "\n")
