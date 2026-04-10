getData <- function(batch_value) {
  library(here)
  library(dplyr)
  df1 <- readr::read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  ) %>%
  # Convert ActivityDepth_m to numeric for plotting
  mutate(ActivityDepth_m = as.numeric(ActivityDepth_m))

  df2 <- read.csv(here::here("data/allDataSEACAR.csv")) %>% 
  # Align column types with df1:
  # Convert logical columns to character (df1 has these as character)
  mutate(across(where(is.logical), as.character)) %>%
  # Convert SampleDate to datetime to match df1 format
  mutate(SampleDate = as.POSIXct(SampleDate, format = "%Y-%m-%d", tz = "UTC"))
  

  df1 <- df1[df1$ParameterName == batch_value, ]
  df2 <- df2[df2$ParameterName == batch_value, ]
  
  return(list(SEACAR_STD = df1, OLD = df2))
}