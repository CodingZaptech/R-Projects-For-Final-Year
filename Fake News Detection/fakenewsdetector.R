# fakenewsdetector.R
# Entry point for Fake News Detection
# Trains model to classify news as real or fake

source("modelTrain.R")
source("modelPredict.R")

library(tm)
library(caret)

data <- read.csv("news.csv", stringsAsFactors = FALSE)

# Preprocess text
corpus <- VCorpus(VectorSource(data$text))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
dtm <- DocumentTermMatrix(corpus)

# Split data
set.seed(123)
trainIndex <- createDataPartition(data$label, p = 0.7, list = FALSE)
trainData <- dtm[trainIndex, ]
testData <- dtm[-trainIndex, ]
trainLabels <- data$label[trainIndex]
testLabels <- data$label[-trainIndex]

# Train model
model <- trainModel(trainData, trainLabels)

# Predict
predictions <- predictFakeNews(model, testData)

# Evaluate
confMatrix <- table(Predicted = predictions, Actual = testLabels)
print(confMatrix)
accuracy <- sum(diag(confMatrix)) / sum(confMatrix)
cat("Model Accuracy:", round(accuracy * 100, 2), "%\n")
