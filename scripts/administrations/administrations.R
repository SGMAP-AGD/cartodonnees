# https://raw.githubusercontent.com/cquest/annuaire-services-publics/master/annuaire.sjson
# https://www.data.gouv.fr/fr/datasets/annuaire-des-services-publics-nationaux/

library(rjson)
library(httr)

administrations <-  content(GET(url = "https://raw.githubusercontent.com/cquest/annuaire-services-publics/master/annuaire.sjson"))
administrations <- strsplit(administrations, "\n")


administrations[0][0][0]



