library(here)
source(here("SEACARProgramCompare/mapProgramNameToShortName.R"))
getListOfValues <- function() {
  df1 <- readr::read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  ) %>% 
  dplyr::mutate(
    ProgramName = sapply(ProgramName, mapProgramNameToShortName)
  )
  unique_df1 <- unique(df1$ProgramName)

  df2 <- read.csv(here::here("data/allDataSEACAR.csv")) %>% 
  dplyr::mutate(
    ProgramName = sapply(ProgramName, mapProgramNameToShortName)
  )
  unique_df2 <- unique(df2$ProgramName)
  
  # merge the two unique lists
  all_unique <- unique(c(unique_df1, unique_df2))
  
  return(all_unique)
}
