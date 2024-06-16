
# Load necessary libraries
library(tidyverse)
library(here)
library(rio)

# Set the file path using 'here' function
filepath <- here::here('data', 'who_tubercolosis_data.csv')

# Import data into a tibble using pipe operator

tb <- filepath |> rio::import(setclass = 'tibble')



# Display the entire tibble
tb

# Display an overview of the tibble's structure
tb |> glimpse()

# Display the first few rows of the tibble
head(tb)

# Display the dimensions of the tibble (number of rows and columns)
dim(tb)

# Display the column names of the tibble
names(tb)

# Display unique country names using tail without the pipe operator
unique(tail(tb, n = 50)$country)

# Display unique country names using pipe operator
tb %>%
  tail(50) %>%
  distinct(country)

# Display unique values of the column 'who_region'
tb %>%
  distinct(who_region)

# Count occurrences of each unique 'who_region' value
tb %>%
  count(who_region)

# Count occurrences of each unique 'who_region' value and arrange in ascending order
tb %>%
  count(who_region) %>%
  arrange(n)

# Count occurrences of each unique 'who_region' value and arrange in descending order
tb %>%
  count(who_region) %>%
  arrange(-n) # alternatively, use  arrange(desc(n))

# Filter the tibble for rows where 'country' is "India"
tb %>%
  filter(country == "India")

# Filter the tibble for rows where 'year' is greater than or equal to 2015 and 'country' is "India"
tb %>%
  filter(year >= 2015 & country == "India")

# Create a vector with countries from the Indian Subcontinent
indian_subcont <- c("India", "Nepal", "Pakistan", "Bangladesh", "Afghanistan")

# Filter the tibble for rows where 'country' is in the Indian Subcontinent and display unique countries
tb %>%
  filter(country %in% indian_subcont) %>%
  distinct(country)

# Summarize mean and standard deviation of 'hiv_percent' column
tb %>%
  summarize(
    mean_hiv_percent = mean(hiv_percent, na.rm = TRUE),
    sd_hiv_percent = sd(hiv_percent, na.rm = TRUE)
  )

# Group the tibble by 'year'
tb %>%
  group_by(year)

# Group the tibble by 'year' and 'who_region'
tb %>%
  group_by(year, who_region)

# Group the tibble by 'year' and calculate mean and standard deviation of 'incidence_100k'
tb %>%
  group_by(year) %>%
  summarize(
    mean_inc = mean(incidence_100k, na.rm = TRUE),
    sd_inc = sd(incidence_100k, na.rm = TRUE)
  )

# Create a new column 'indian_sub1' based on membership in the Indian Subcontinent and select specific columns
tb %>%
  mutate(indian_sub1 = if_else(country %in% indian_subcont, "Indian Subcontinent", "Others")) %>%
  select(country, indian_sub1) %>%
  distinct()
