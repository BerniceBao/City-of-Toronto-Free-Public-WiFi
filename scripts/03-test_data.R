#### Preamble ####
# Purpose: Tests if the simulated data is within the required bounds
# Author: Bernice Bao
# Date: 24 January 2023 
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 00-simulate_data.R

#### Workspace setup ####
library(tidyverse)

#### Test data ####

data = read_csv("outputs/data/simulated_data.csv")

# Test1
all(data$ward_number >= 1 & data$ward_number <= 25)

#Test2
all(data$ward %in% c("Etobicoke North", "Etobicoke Centre", "Etobicoke-Lakeshore", "Parkdale-High Park", "York South-Weston", "York Centre", "Humber River-Black Creek", "Eglinton-Lawrence", "Davenport", "Spadina-Fort York", "University-Rosedale", "Toronto-St. Paul's", "Toronto Centre", "Toronto-Danforth", "Don Valley West", "Don Valley East", "Don Valley North", "Willowdale", "Beaches-East York", "Scarborough Southwest", "Scarborough Centre", "Scarborough-Agincourt", "Scarborough North", "Scarborough-Guildwood", "Scarborough-Rouge Park"))
