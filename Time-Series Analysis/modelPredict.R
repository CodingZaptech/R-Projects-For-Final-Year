# modelPredict.R
# Forecast time series using trained ARIMA model

library(forecast)

predictSeries <- function(model, h = 12) {
  forecasted <- forecast(model, h = h)
  return(forecasted)
}
