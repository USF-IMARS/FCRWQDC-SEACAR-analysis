# Maps names between the old dataset and SEACAR export to short names.
#
# Mapping from https://docs.google.com/spreadsheets/d/1GVJ4kyze9s_XfiOls81FaKKY4B1dH7Ex08UM7B6A_pc/edit?usp=sharing
#
# FWCRWQDC Name        SEACAR ProgramName
# =================    =================================================================
# AOML_FBBB            Atlantic Oceanographic and Meteorological Laboratory (AOML) South Florida Program Synoptic Shipboard Surveys
# BBAP                 North Biscayne Bay Discrete Water Quality Program
# BBWW                 Biscayne Bay Water Watch
# BROWARD              Broward County Water Quality Monitoring
# BROWARD_STORET      Broward County Water Quality Monitoring
# DEP                  Southeast Florida Water Quality Assessment Survey
# DERM_BBWQ            Miami-Dade County DERM Benthic Habitat Monitoring Program
# DERM_BBWQ_STORET    Miami-Dade County DERM Benthic Habitat Monitoring Program
# FIU_Estuaries        SERC Water Quality Monitoring Network
# FIU_WQMP             Florida Keys National Marine Sanctuary Water Quality Monitoring Project
# FIU_WQMP_HISTORICAL  Florida Keys National Marine Sanctuary Water Quality Monitoring Project
# FIU_WQMP_RECENT      Florida Keys National Marine Sanctuary Water Quality Monitoring Project
# MiamiBeach           City of Miami Beach Water Monitoring
# PALMBEACH            Palm Beach County Water Quality Program
# PALMBEACH_STORET     Palm Beach County Water Quality Program
# SFER                 Atlantic Oceanographic and Meteorological Laboratory (AOML) South Florida Program Synoptic Shipboard Surveys

nameMapping <- list(
  # "shortname" = c("name1", "name2", "name...")
  "AOML_SFPSSS" = c(
    # SEACAR
    "Atlantic Oceanographic and Meteorological Laboratory (AOML) South Florida Program Synoptic Shipboard Surveys",
    # Old dataset
    "AOML_FBBB",
    "SFER"
  ),
  "NBB_DWQP" = c(
    # SEACAR
    "North Biscayne Bay Discrete Water Quality Program",
    # Old dataset
    "BBAP"
  ),
  "BBWW" = c(
    # SEACAR
    "Biscayne Bay Water Watch",
    # Old dataset
    "BBWW"
  ),
  "BROWARD" = c(
    # SEACAR
    "Broward County Water Quality Monitoring",
    # Old dataset
    "BROWARD_STORET"
  ),
  "SE_FL_WQAS" = c(
    # SEACAR
    "Southeast Florida Water Quality Assessment Survey",
    # old dataset
    "DEP"
  ),
  "DERM" = c(
    # SEACAR
    "Miami-Dade County DERM Benthic Habitat Monitoring Program",
    # old dataset
    "DERM_BBWQ_STORET",
    "DERM_BBWQ"
  ),
  "SERC" = c(
    # SEACAR
    "SERC Water Quality Monitoring Network",
    # old dataset
    "FIU_Estuaries"
  ),
  "FKNMS" = c(
    # SEACAR
    "Florida Keys National Marine Sanctuary Water Quality Monitoring Project",
    # Old Dataset
    "FIU_WQMP",
    "FIU_WQMP_HISTORICAL",
    "FIU_WQMP_RECENT"
  ),
  "MiamiBeach" = c(
    # SEACAR
    "City of Miami Beach Water Monitoring",
    # Old dataset
    "MiamiBeach"
  ),
  "PalmBeach" = c(
    # SEACAR
    "Palm Beach County Water Quality Program",
    # Old dataset
    "PALMBEACH"
  )
)

mapProgramNameToShortName <- function(programName){
  # Iterate through nameMapping to find matching short name
  for (shortName in names(nameMapping)) {
    if (programName %in% nameMapping[[shortName]]) {
      return(shortName)
    }
  }
  # Raise error if name not found
  stop(paste("No matching short name found for:", programName))
}
