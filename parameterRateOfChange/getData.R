getData <- function(batch_value, n_rows = 10) {
  library(here)
  library(readr)
  
  print(paste('getting data for', batch_value))
  
  # Read the unified water quality database
  data <- read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  )
  
  # filter for parameter == batch_value
  data <- data[data$ParameterName == batch_value, ]

  return(data)
}