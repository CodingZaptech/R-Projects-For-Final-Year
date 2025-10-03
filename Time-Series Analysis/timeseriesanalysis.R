# timeseriesanalysis.R
# Entry point for Time-Series Analysis
# Loads data, trains ARIMA model, forecasts future values

source("modelTrain.R")
source("modelPredict.R")

library(forecast)

data <- read.csv("timeseries.csv")
tsData <- ts(data$value, frequency = 12) # Monthly data

# Train model
model <- trainModel(tsData)

# Forecast next 12 periods
forecasted <- predictSeries(model, h = 12)
print(forecasted)
plot(forecasted)
