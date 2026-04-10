getListOfValues <- function() {
  df <- readr::read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|",
    on_problems = "warn"   # warns instead of erroring on bad rows
  )  
  return(unique(df$ParameterName))
}