NH <- read.csv(file.choose())
NH

library(stringr)

NH$summons <- str_detect(NH$violation, "Summons")

library(esquisse)
library(ggplot2)
library(dplyr)
esquisser(NH)

#orginal dataset is too large, so I selected the columns that I wanted.
NH_gender <-select(NH,driver_gender, stop_outcome)

esquisser(NH_gender)
library(ggplot2)

#Bar Chart for outcomes by gender
ggplot(data = NH_gender) +
  aes(x = stop_outcome) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "Type of Stops by Gender",
    x = "Unassigned, Female, and Male",
    y = "Number of Stops per Outcome") +
  theme_minimal() +
  facet_wrap(vars(driver_gender))

NH$Speeding <- str_detect(NH$violation, "Speeding")

NH_genderspeeding <- select(NH, driver_gender, Speeding)

library(ggplot2)

#Number of Stops by Gender
ggplot(data = NH_genderspeeding) +
  aes(x = driver_gender) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "Number of Stops by Gender",
    x = "Gender",
    y = "Number of Stops") +
  theme_minimal()

#Number of Speeding Stops by Gender
ggplot(data = NH_genderspeeding) +
  aes(x = Speeding) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "\"Were They Speeding\" By Gender",
    x = "Gender",
    y = "Number of Stops") +
  theme_minimal() +
  facet_wrap(vars(driver_gender))

NH_outofstate_gender <- select(NH, driver_gender, out_of_state)

esquisser(NH_outofstate_gender)
library(ggplot2)
#Number of stops for In-State vs. Out-of-State
ggplot(data = NH_outofstate_gender) +
  aes(x = out_of_state) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "Number of Stops for In-State and Out-of-State Drivers",
       x = "Out-of-State Drivers",
       y = "Number of Stops") +
  theme_minimal() 

#Number of Stops, In-State vs. Out-of_State By Gender
ggplot(data = NH_outofstate_gender) +
  aes(x = out_of_state) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "ComparingStops Between Gender and Out-of-State Drivers",
    x = "Out-of-State Drivers by Gender",
    y = "Number of Stops") +
  theme_minimal() +
  facet_wrap(vars(driver_gender))

NHstop_outcome_age <- select(NH, driver_age, stop_outcome)

esquisser(NHstop_outcome_age)
library(ggplot2)

#Histogram of total drivers' ages
ggplot(data = NHstop_outcome_age) +
  aes(x = driver_age) +
  geom_histogram(bins = 30, fill = "#0c4c8a") +
  labs(title = "Distribution of Ages of Drivers Stopped",
    x = "Age",
    y = "Number of Drivers Stopped") +
  theme_minimal()

NHstop_outcome_teenagers <- filter(NHstop_outcome_age, driver_age < 18)

esquisser(NHstop_outcome_teenagers)
library(ggplot2)

#Stop outcomes for Teenagers
ggplot(data = NHstop_outcome_teenagers) +
  aes(x = stop_outcome) +
  geom_bar(fill = "#cf4446") +
  labs(title = "Stop Outcomes for Teenagers",
    x = "Stop Outcome",
    y = "Number of Teenagers Stopped") +
  theme_minimal()

#Where are teenagers stopped?
NHstop_total_location <- select(NH, stop_outcome, driver_age, lat, lon)
NHstop_teenagers_location <- filter(NHstop_total_location, driver_age < 18)

library(leaflet)

a <-c(NHstop_teenagers_location$lat)
b <-c(NHstop_teenagers_location$lon)

#Teenagers Stops on a map
m <- leaflet() %>%
  addTiles() %>%                    # Add default OpenStreetMap map tiles
  addCircleMarkers(lat=a, lng=b)    # Use Circle Markers
m 


c <-c(NH$lat)
d <-c(NH$lon)

#Teenagers Stops on a map
n <- leaflet() %>%
  addTiles() %>%                    # Add default OpenStreetMap map tiles
  addCircleMarkers(lat=c, lng=d)    # Use Circle Markers
n 

