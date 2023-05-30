## Purpose: This script reads in raw weather data and cleans it.

## Inputs: raw_weather.csv - Raw weather data

## Outputs: clean_weather.csv - Clean weather data

## Libraries:
library(tidyverse)

CleanData = function(data, filepath, filename) {

  # Make table wide format instead of long format and select only date, TMIN, and TMAX columns
  # without NA values
  clean_weather = data %>%
    pivot_wider(names_from = element, values_from = value) %>%
    select(date, TMIN, TMAX) %>% 
    mutate(TMIN = ((TMIN * 9/5) / 10) + 32,
           TMAX = ((TMAX * 9/5) / 10) + 32) %>%
    remove_missing()
  
  # Save clean data as csv with "[city]-temps.csv" convention
  write.csv(clean_weather, paste0(filepath, filename),
            row.names = FALSE)
  
}

##Minnesota---------------------------------------------------------------------
# Load in data
raw_weather = read.csv("GroupPresentations/Week3/Data/USW00014922.csv")

# Set filepath
filepath = "GroupPresentations/Week3/Data/"

# Set filename
filename = "stpaul-temps.csv"

CleanData(raw_weather, filepath, filename)

##Urbana------------------------------------------------------------------------
# Load in data
raw_weather = read.csv("GroupPresentations/Week3/Data/USC00118740.csv")

# Set filepath
filepath = "GroupPresentations/Week3/Data/"

# Set filename
filename = "urbana-temps.csv"

CleanData(raw_weather, filepath, filename)

