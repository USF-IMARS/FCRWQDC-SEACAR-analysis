# Visualize Time-Series for comparing SEACAR_STD and OLD_STD data
# for a given station and parameter.
  
library(ggplot2)
library(dplyr)

plotStationParameterTimeSeriesComparison <- function(df, station_id, parameter) {
    # Filter for the station
    df_subset <- df %>% filter(
        ProgramLocationID == station_id,
        ParameterName == parameter
    )

    # get ProgramName for the station
    station_program <- df_subset %>%
        pull(ProgramName) %>% 
        unique() %>%
        first()

    # get ParameterUnits for source = "SEACAR_STD"
    seacar_units <- df_subset %>% 
        filter(source == "SEACAR_STD") %>% 
        pull(ParameterUnits) %>% 
        unique() %>% 
        first()

    # get ParameterUnits for source = "OLD_STD"
    old_units <- df_subset %>% 
        filter(source == "OLD_STD") %>% 
        pull(ParameterUnits) %>% 
        unique() %>% 
        first()


    # Create plot
    ggplot(df_subset, aes(x = SampleDate, y = ResultValue, color = source)) +
        geom_point(alpha = 0.4, shape=4) +
        labs(
        title = paste(station_program, "\n", station_id),
        x = "Sample Date",
        y = paste(parameter, "[", seacar_units, "||", old_units, "]")
        ) +
        theme_minimal() +
        theme(legend.position = "none")
}