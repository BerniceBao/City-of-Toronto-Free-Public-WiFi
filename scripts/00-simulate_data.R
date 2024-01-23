#### Preamble ####
# Purpose: Simulate data on Location and description data of all City of Toronto free public WiFi locations and make table
# Author: Bernice Bao
# Date: 23 January 2024 
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: -


#### Workspace setup ####
library(tidyverse)
install.packages("opendatatoronto")
install.packages("knitr")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

citation() # Get the citation information for R
citation("ggplot2") # Get citation information for a package


#### Simulate data ####
set.seed(85)

simulated_occupancy_data <-
  tibble(
    date = rep(x = as.Date("2021-01-01") + c(0:364), times = 3),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    shelter = c(
      rep(x = "Shelter 1", times = 365),
      rep(x = "Shelter 2", times = 365),
      rep(x = "Shelter 3", times = 365)
    ),
    number_occupied =
      rpois(
        n = 365 * 3,
        lambda = 30
      ) # Draw 1,095 times from the Poisson distribution
  )

head(simulated_occupancy_data)


