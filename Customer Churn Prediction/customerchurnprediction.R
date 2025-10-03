# Entry point for Customer Churn Prediction
# Loads telecom data, trains model, and predicts churn

source("modelTrain.R")
source("modelPredict.R")

data <- read.csv("telecom_churn.csv")

set.seed(123)
trainIndex <- sample(1:nrow(data), 0.7 * nrow(data))
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

model <- trainModel(trainData)
predictions <- predictChurn(model, testData)

confMatrix <- table(Predicted = predictions, Actual = testData$Churn)
print(confMatrix)
accuracy <- sum(diag(confMatrix)) / sum(confMatrix)
cat("Model Accuracy:", round(accuracy * 100, 2), "%\n")
