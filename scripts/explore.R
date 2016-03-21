library(jsonlite)
library(purrr)
library(magrittr)
library(plyr)
library(tidyJSON)
bases <- fromJSON("data/bases.json", simplifyVector = FALSE)
names(bases)
length(bases)

bases[[1]] %>% names()

# List des champs
bases %>% 
  llply(.data = ., .fun = names) %>% 
  unlist() %>% 
  unique()

bases %>% 
  llply(.data = ., .fun = names) %>% 
  
bases[[13]]

names(gestionnaire)
bases %>% 
  keep("gestionnaire" %in% names())

  map_chr("gestionnaire")

# bases[[1]] %>% 
#   keep(is.character)
