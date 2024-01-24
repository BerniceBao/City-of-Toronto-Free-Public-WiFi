#### Preamble ####
# Purpose: Cleans the raw Toronto free public wifi data and 25 wards data from opendatatoronto r package
# Author: Bernice Bao
# Date: 23 January 2024
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: run "01-download_data.R" before executing this file

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)


#### Clean data ####
# load in raw data
raw_wifi_data <- read_csv("inputs/data/wifi_data.csv")

# clean and select column of interest
cleaned_wifi_data <-
  raw_wifi_data |>
  filter(has_wifi == "Y")|> # filter on the locations with free public wifi
  select(building_type, ward, ward_number) # only select the relevant columns
  
# rename the variables
cleaned_wifi_data <-
  cleaned_wifi_data |>
  rename(BuildingType = building_type, Ward = ward, WardNumber = ward_number)

head(cleaned_wifi_data)

#### Save data ####
# write cleaned data as csv
write_csv(cleaned_wifi_data, "outputs/data/cleaned_wifi_data.csv")


#### Clean data 2 ####
# load in raw data
raw_ward_data <- read_csv("inputs/data/ward_data.csv")

# clean and select column of interest
cleaned_ward_data <-
  raw_ward_data |>
  filter(`City of Toronto Profiles` == "Total - Age" | `City of Toronto Profiles` == "Total - Household total income groups in 2020 for private households - 25% sample data")|> # filter on the population and income
  select(`City of Toronto Profiles`,...2, ...3, ...4, ...5, ...6, ...7, ...8, ...9, ...10, ...11, ...12, ...13, ...14, ...15, ...16, ...17, ...18, ...19, ...20, ...21, ...22, ...23, ...24, ...25) # only select the relevant columns

# since this dataset organizes the data in first column as variables
# the variables I interested in have to be considered as observations by R 
# so I create a new database and keep all the data same 
# just move the variables to the correct position

# rename the variables
cleaned_ward_data <- mutate(poppulation = ) |> rename(population = Total - Age)

head(cleaned_wifi_data)

#### Save data ####
# write cleaned data as csv
write_csv(cleaned_wifi_data, "outputs/data/cleaned_wifi_data.csv")

