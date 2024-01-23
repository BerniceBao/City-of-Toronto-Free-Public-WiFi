#### Preamble ####
# Purpose: Cleans the raw Toronto free public wifi data and 25 wards data from opendatatoronto r package
# Author: Bernice Bao
# Date: 23 January 2024
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: Execute 01-download_data.R prior to running this file

#### Workspace setup ####
library(tidyverse)
library(janitor)


#### Save data ####
# load in raw data
wifi_data <-
  read_csv("inputs/data/wifi_data.csv")

# clean the names and select column of interest
cleaned_wifi_data <-
  clean_names(wifi_data) |>
  select(tfs_alarm_time)

# reorder data in descending order
cleaned_wifi_data <- cleaned_wifi_data[order(
  as.Date(cleaned_wifi_data$tfs_alarm_time, format="%Y/%m/%d")
), ]




# write cleaned data as csv
write_csv(cleaned_wifi_data, "inputs/data/cleaned_wifi_data.csv")


#### Clean data ####
raw_data <- read_csv("inputs/data/plane_data.csv")

cleaned_wifi_data <-
  wifi_data |>
  janitor::clean_names() |>
  select(has_wifi, building_type, ward, ward_number) |>
  filter(wing_width_mm != "caw") |>
  mutate(
    flying_time_sec_first_timer = if_else(flying_time_sec_first_timer == "1,35",
                                   "1.35",
                                   flying_time_sec_first_timer)
  ) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "490",
                                 "49",
                                 wing_width_mm)) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "6",
                                 "60",
                                 wing_width_mm)) |>
  mutate(
    wing_width_mm = as.numeric(wing_width_mm),
    wing_length_mm = as.numeric(wing_length_mm),
    flying_time_sec_first_timer = as.numeric(flying_time_sec_first_timer)
  ) |>
  rename(flying_time = flying_time_sec_first_timer,
         width = wing_width_mm,
         length = wing_length_mm
         ) |> 
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
