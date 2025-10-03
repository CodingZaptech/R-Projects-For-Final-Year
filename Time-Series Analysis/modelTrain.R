# modelTrain.R
# Train ARIMA model for time series forecasting

library(forecast)

trainModel <- function(tsData) {
  model <- auto.arima(tsData)
  print(model)
  return(model)
}
