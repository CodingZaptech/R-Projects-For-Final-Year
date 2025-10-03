# sentimentanalysisproject.R
# Entry point for Sentiment Analysis
# Loads data, trains model, and predicts sentiment

source("modelTrain.R")
source("modelPredict.R")

library(tm)
library(caret)

# Load dataset
data <- read.csv("sentiment_data.csv", stringsAsFactors = FALSE)

# Preprocess text
corpus <- VCorpus(VectorSource(data$text))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
dtm <- DocumentTermMatrix(corpus)

# Split data
set.seed(123)
trainIndex <- createDataPartition(data$sentiment, p = 0.7, list = FALSE)
trainData <- dtm[trainIndex, ]
testData <- dtm[-trainIndex, ]
trainLabels <- data$sentiment[trainIndex]
testLabels <- data$sentiment[-trainIndex]

# Train model
model <- trainModel(trainData, trainLabels)

# Predict
predictions <- predictSentiment(model, testData)

# Evaluate accuracy
confMatrix <- table(Predicted = predictions, Actual = testLabels)
print(confMatrix)
accuracy <- sum(diag(confMatrix)) / sum(confMatrix)
cat("Model Accuracy:", round(accuracy * 100, 2), "%\n")
