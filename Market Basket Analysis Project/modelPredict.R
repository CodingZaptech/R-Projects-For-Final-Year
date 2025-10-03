# modelPredict.R
# Function to predict association rules (top N)

predictRules <- function(rules, n = 5) {
  topRules <- head(sort(rules, by = "lift"), n)
  return(topRules)
}
