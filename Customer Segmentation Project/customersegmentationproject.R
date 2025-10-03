# customersegmentationproject.R
# Entry point for Customer Segmentation
# Clusters customers using K-Means

source("modelTrain.R")
source("modelPredict.R")

data <- read.csv("customer_data.csv")
set.seed(123)

# Train clustering model
model <- trainModel(data)

# Predict clusters
clusters <- predictSegment(model, data)
table(clusters)
