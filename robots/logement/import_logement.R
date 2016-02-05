# Importer les données de la cartographie de données logement
# https://www.data.gouv.fr/fr/datasets/ouverture-des-donnees-publiques-du-logement-rapport-et-cartographie/

df <- read.csv("https://www.data.gouv.fr/s/resources/ouverture-des-donnees-publiques-du-logement-rapport-et-cartographie/20151002-171050/Cartographie_des_donnees_logement_-_2015-01-26.csv")

by(df, 1:nrow(df), function(row){
  
  row <- as.list(row)
  
  #"Bases.enquêtes.données"     
  row['nom'] <- row['Bases.enquêtes.données']
  row['Bases.enquêtes.données'] <- NULL
  
  #"Gestionnaire"   
  row['gestionnaire'] <- row['Gestionnaire']
  row['Gestionnaire'] <- NULL
  
  #"Description"
  row['description'] <- row['Description']
  row['Description'] <- NULL
  
  #"Origine.des.données"
  row['origine'] <- row['Origine.des.données']
  row['Origine.des.données'] <- NULL
  
  #"Conditions.d.accès"
  row['Conditions.d.accès'] <- NULL
  
  #"Coût.d.accès"
  row['Coût.d.accès'] <- NULL
  
  #"Données.en.open.data"
  row['Données.en.open.data'] <- NULL
  
  #"Granularité.géographique"
  if(row['Granularité.géographique'] != ""){
    row['granularite'] <- row['Granularité.géographique']
  }
  row['Granularité.géographique'] <- NULL
  
  #"Fréquence"
  row['Fréquence'] <- NULL
  
  #"Qualité.des.données"  
  row['Qualité.des.données'] <- NULL
  
  #"Remarques.et.perspectives.éventuelles"
  row['commentaire'] <- row['Remarques.et.perspectives.éventuelles']
  row['Remarques.et.perspectives.éventuelles'] <- NULL
  
  #"Pour.en.savoir.plus..fiche.de.l.annexe.12.du.rapport.sur.l.organisation.du.service.statistique.dans.le.domaine.du.logement"
  row['Pour.en.savoir.plus..fiche.de.l.annexe.12.du.rapport.sur.l.organisation.du.service.statistique.dans.le.domaine.du.logement'] <- NULL
  
  write(toJSON(row), paste("data/",digest(paste(row['gestionnaire'],row['nom']),algo="md5"),".json",sep=""))
})