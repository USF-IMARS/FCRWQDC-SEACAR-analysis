getListOfValues <- function() {
  library(here)
  data <- readr::read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  )
  
  # get list of unique values from "parameter" column
  values <- unique(data$ParameterName)
  
  return(values)
}