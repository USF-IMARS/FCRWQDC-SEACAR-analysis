getListOfValues <- function() {
  library(here)
  data <- read.csv(here("data/Unified_WQ_Database(2023 updated).csv"))

  # get list of unique values from "parameter" column
  values <- unique(data$ParameterName)
  
  return(values)
}