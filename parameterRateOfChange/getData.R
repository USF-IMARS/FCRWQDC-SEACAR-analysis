getData <- function(batch_value, n_rows = 10) {
  print(paste('getting data for', batch_value))
  
  # Read the unified water quality database
  data <- read.csv("../data/Unified_WQ_Database(2023 updated).csv")
  
  # filter for parameter == batch_value
  data <- data[data$Parameter == batch_value, ]

  return(data)
}