# Maps long names from SEACAR export to short names matching the old dataset.
mapSEACARProgramNameToShortName <- function(SEACARName){
  library(dplyr)
  case_when(
    # === names from old dataset
    SEACARName == "Florida Keys National Marine Sanctuary Water Quality Monitoring Project" ~ "FKNMS",
    SEACARName == "Miami-Dade County DERM Benthic Habitat Monitoring Program" ~ "DERM",
    SEACARName == "Biscayne Bay Water Watch" ~ "BBWW",
    SEACARName == "City of Miami Beach Water Monitoring" ~ "MiamiBeach",
    SEACARName == "Palm Beach County Water Quality Program" ~ "PALMBEACH",
    SEACARName == "Broward County Water Quality Monitoring" ~ "BROWARD",

    # === names from old without matches
    # SEACARName == "?" ~ "SFER"
    # SEACARName == "?" ~ "FIU_Estuaries"
    # SEACARName == "?" ~ "FIU_WQMP"
    # SEACARName == "?" ~ "AOML_FBBB"
    # SEACARName == "?" ~ "BBAP"
    # SEACARName == "?" ~ "DEP"
    # SEACARName == "?" ~ "DERM_BBWQ"

    # === new short names
    SEACARName == "Atlantic Oceanographic and Meteorological Laboratory (AOML) South Florida Program Synoptic Shipboard Surveys" ~ "AOML S FL PSSS",
    SEACARName == "SERC Water Quality Monitoring Network" ~ "SERC",
    SEACARName == "North Biscayne Bay Discrete Water Quality Program" ~ "N BB DWQP",
    SEACARName == "Southeast Florida Water Quality Assessment Survey" ~ "SE FL WQAS"
  )
}