#### Preamble ####
# Purpose: Downloads and saves the data from the opendatatoronto r package
# Author: Bernice Bao
# Date: 23 January 2024
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: -

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####

# get package
package <- show_package("city-of-toronto-free-public-wifi")
# get all resources for this package
resources <- list_package_resources("city-of-toronto-free-public-wifi")
# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
# load the first datastore resource as a sample
wifi_data <- filter(datastore_resources, row_number()==1) |> get_resource()
wifi_data

#### Save data ####
# change raw_data to whatever name you assigned when you downloaded it.
write_csv(wifi_data, "inputs/data/wifi_data.csv") 



#### Download data 2####

df = list_package_resources("6678e1a6-d25f-4dff-b2b7-aa8f042bc2eb") |>
  filter(name == 
           "2023-WardProfiles-2011-2021-CensusData") |>
  get_resource()
ward_data <- df$`2021 One Variable`

#### Save data 2 ####
write_csv(ward_data,"inputs/data/ward_data.csv")


