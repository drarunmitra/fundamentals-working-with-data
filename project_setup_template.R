# This R code is for the set up of folders and files in the Project for better management
library(here)
library(fs)

dir_create(here("data"))
dir_create(here("data", "raw_data"))
dir_create(here("data", "clean_data"))
dir_create(here("code"))
dir_create(here("analysis"))
dir_create(here("plots"))
dir_create(here("files"))
