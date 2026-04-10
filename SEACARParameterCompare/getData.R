getData <- function(batch_value) {
  # print(paste('getting data for', batch_value,'...'))
  # Read the unified water quality database
  df1 <- read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  )
  df2 <- read.csv(here::here("data/allDataSEACAR.csv"))
  
  df1 <- df1[df1$ParameterName == batch_value, ]
  df2 <- df2[df2$ParameterName == batch_value, ]
  
  return(list(SEACAR_STD = df1, OLD = df2))
}