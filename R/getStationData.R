# Loads data for a given station from both SEACAR_STD and OLD sources.
library(here)
library(dplyr)
source(here("R/mapProgramNameToShortName.R"))

getStationData <- function(station_id) {
  # Delimiter: "|"
  # chr  (29): ProgramName, Habitat, IndicatorName, ParameterName, ParameterUnits, SEACA...
  # dbl  (11): RowID, ProgramID, IndicatorID, ParameterID, ResultValue, Year, Month, Inc...
  # dttm  (2): SampleDate, ExportVersion
  df1 <- readr::read_delim(
    here("data/Discrete WQ - 10006.txt"),
    delim = "|"
  ) %>%
    filter(ProgramLocationID == station_id) %>%
    # Convert ActivityDepth_m to numeric for plotting
    mutate(
      ActivityDepth_m = as.numeric(ActivityDepth_m),
      source = "SEACAR_STD",
      ProgramName = mapProgramNameToShortName(ProgramName)
    )

  # chr  (16): Habitat, IndicatorName, ManagedAreaName, RelativeDepth, DetectionUnit, SE...
  # dbl  (16): ...1, RowID, ProgramID, IndicatorID, ParameterID, AreaID, Year, Month, MD...
  # lgl   (2): TotalDepth_m, ValueQualifierSource
  # dttm  (1): ExportVersion
  # date  (1): SampleDate
  df2 <- read.csv(here::here("data/allDataSEACAR.csv")) %>% 
    filter(ProgramLocationID == station_id) %>%
    # Align column types with df1:
    # Convert logical columns to character (df1 has these as character)
    mutate(across(where(is.logical), as.character)) %>%
    mutate(
        # Convert numeric columns to character to match df1
        AreaID = as.character(AreaID),
        TotalDepth_m = as.character(TotalDepth_m),
        # Convert SampleDate to datetime to match df1 format
        SampleDate = as.POSIXct(SampleDate, format = "%Y-%m-%d", tz = "UTC"),
        source = "OLD",
        ProgramName = mapProgramNameToShortName(ProgramName)
    )
  
  # join dfs on common columns
  df <- merge(df1, df2, all = TRUE)
  
  return(df)
}