getData <- function(batch_value) {
  library(here)
  library(dplyr)
  # print(paste('getting data for', batch_value,'...'))

  # Delimiter: "|"
  # chr  (29): ProgramName, Habitat, IndicatorName, ParameterName, ParameterUnits, SEACA...
  # dbl  (11): RowID, ProgramID, IndicatorID, ParameterID, ResultValue, Year, Month, Inc...
  # dttm  (2): SampleDate, ExportVersion
  df1 <- readr::read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  )


  # chr  (16): Habitat, IndicatorName, ManagedAreaName, RelativeDepth, DetectionUnit, SE...
  # dbl  (16): ...1, RowID, ProgramID, IndicatorID, ParameterID, AreaID, Year, Month, MD...
  # lgl   (2): TotalDepth_m, ValueQualifierSource
  # dttm  (1): ExportVersion
  # date  (1): SampleDate
  df2 <- read.csv(here::here("data/allDataSEACAR.csv")) %>% 
  # Align column types with df1:
  # Convert logical columns to character (df1 has these as character)
  mutate(across(where(is.logical), as.character)) %>%
  # Convert numeric columns to character to match df1
  mutate(AreaID = as.character(AreaID),
         ActivityDepth_m = as.character(ActivityDepth_m),
         TotalDepth_m = as.character(TotalDepth_m)) %>%
  # Convert SampleDate to datetime to match df1 format
  mutate(SampleDate = as.POSIXct(SampleDate, format = "%Y-%m-%d", tz = "UTC"))
  

  df1 <- df1[df1$ParameterName == batch_value, ]
  df2 <- df2[df2$ParameterName == batch_value, ]
  
  return(list(SEACAR_STD = df1, OLD = df2))
}