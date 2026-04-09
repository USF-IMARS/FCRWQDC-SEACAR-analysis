getData <- function(batch_value) {
  # print(paste('getting data for', batch_value,'...'))
  df1 <- read.csv(here::here("data/Unified_WQ_Database(2023 updated)_remapped.csv"))
  df2 <- read.csv(here::here("data/allDataSEACAR.csv"))
  
  df1 <- df1[df1$ParameterName == batch_value, ]
  df2 <- df2[df2$ParameterName == batch_value, ]
  
  return(list(SEACAR_STD = df1, OLD = df2))
}