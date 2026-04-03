getListOfValues <- function() {
  data <- read.csv("../data/Unified_WQ_Database(2023 updated).csv")

  # get list of unique values from "parameter" column
  values <- unique(data$Parameter)
  
  return(values)
}