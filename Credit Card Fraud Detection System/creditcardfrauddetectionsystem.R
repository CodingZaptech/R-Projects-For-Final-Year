# creditcardfrauddetectionsystem.R
# Entry point for the Credit Card Fraud Detection System
# This script loads the data, trains the model, and evaluates predictions

# Load required scripts
source("modelTrain.R")
source("modelPredict.R")

# Load dataset
# Make sure the dataset CSV file is in the working directory
data <- read.csv("creditcard.csv")

# Split data into training and testing sets
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.7 * nrow(data))
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Train the model
model <- trainModel(trainData)

# Predict on test data
predictions <- predictFraud(model, testData)

# Evaluate model accuracy
confMatrix <- table(Predicted = predictions, Actual = testData$Class)
print(confMatrix)
accuracy <- sum(diag(confMatrix)) / sum(confMatrix)
cat("Model Accuracy:", round(accuracy * 100, 2), "%\n")
