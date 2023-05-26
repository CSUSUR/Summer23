## Changing "What" comments into "Why" comments

## Background: 
##      - We have weather data with columns including TMIN and TMAX (Celsius)
##      - We're tasked with converting TMIN and TMAX to Fahrenheit
##      - We also want to drop NA values because we are only concerned with plotting
##      - We want to remove the year 2000 due to unreliable measurements

# Multiply TMIN and TMAX columns by 9/5 then add 32
clean_weather = mutate(raw_weather, TMIN = (TMIN * 9/5) + 32,
                       TMAX = (TMAX * 9/5) + 32)

# Use remove_missing() to remove NA values from our data
clean_weather = remove_missing(clean_weather)

# Use filter() to remove the year 2000 from our data
clean_weather = filter(clean_weather, year != '2000')

