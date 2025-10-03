# speechemotionrecognition.R
# Entry point for Speech Emotion Recognition
# Extracts features and predicts emotion from audio data

source("modelTrain.R")
source("modelPredict.R")

library(tuneR)
library(seewave)
library(caret)

# Load dataset
data <- read.csv("speech_features.csv")

# Split data
set.seed(123)
trainIndex <- createDataPartition(data$emotion, p = 0.7, list = FALSE)
trainData <- data[trainIndex, -ncol(data)]
testData <- data[-trainIndex, -ncol(data)]
trainLabels <- data$emotion[trainIndex]
testLabels <- data$emotion[-trainIndex]

# Train model
model <- trainModel(trainData, trainLabels)

# Predict
predictions <- predictEmotion(model, testData)

# Evaluate
confMatrix <- table(Predicted = predictions, Actual = testLabels)
print(confMatrix)
accuracy <- sum(diag(confMatrix)) / sum(confMatrix)
cat("Model Accuracy:", round(accuracy * 100, 2), "%\n")
