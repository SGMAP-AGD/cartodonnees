# Importer les données de la cartographie de données santé
# https://www.data.gouv.fr/fr/datasets/cartographie-des-bases-de-donnees-publiques-en-sante/

require(readODS)
require(RJSONIO)

if(!file.exists("sante/Cartographie-des-donnees-publiques-de-sante-6-mai-2014.ods")){
  download.file("https://www.data.gouv.fr/s/resources/cartographie-des-bases-de-donnees-publiques-en-sante/20151130-105038/Cartographie-des-donnees-publiques-de-sante-6-mai-2014.ods","sante/Cartographie-des-donnees-publiques-de-sante-6-mai-2014.ods")
}

# 4ème feuillet sans la première ligne
df <- read.ods("sante/Cartographie-des-donnees-publiques-de-sante-6-mai-2014.ods")[[4]][-1,]
# Suppression de la seconde ligne
df <- df[-1,]

names(df) <- c("typo1",
  "typo2",
  "nom",
  "gestionnaire",
  "origine",
  "donnees",
  "acces",
  "commentaire_acces",
  "cout_acces",
  "format_mad",
  "commentaire_format_mad",
  "condition_reutilisation",
  "portail_mad",
  "2donnees",
  "2acces",
  "2commentaire_acces",
  "2cout_acces",
  "2format_mad",
  "2commentaire_format_mad",
  "2condition_reutilisation",
  "2portail_mad",
  "commentaire")

by(df, 1:nrow(df), function(row){
  row <- as.list(row)
  if(row['typo1'] != ""){
    
    # Intégration des champs de typologie aux commentaires
    if(row['typo2'] != ""){
      row['commentaire'] <- paste(row['commentaire'],
                                  "Cette base",
                                  row['typo2'],
                                  "fait partie de la catégorie",
                                  row['typo2'],
                                  "du Ministère des Affaires sociales, de la Santé et des Droits des femmes.")
    }
    row['typo1'] <- NULL
    row['typo2'] <- NULL
    
    #Renommage de l'origine en "alimentation"
    if(row['origine'] != ""){
      row['alimentation'] <- row['origine']
    }
    row['origine'] <- NULL
    
    # Sélection du champ données et renomage en description
    if(row['donnees'] == "" && row['2donnees'] == ""){ # Les 2 sont vides
      row['donnees'] <- NULL
      row['2donnees'] <- NULL
    }
    else if(row['donnees'] != "" && row['2donnees'] == ""){ # 2donnees est vide
      row['2donnees'] <- NULL
    }
    else { 
      row['donnees'] <- row['2donnees']
      row['2donnees'] <- NULL
    }
    row['description'] <- row['donnees']
    row['donnees'] <- NULL
    
    # Acces
    row['acces'] <- NULL
    row['2acces'] <- NULL
    
    # Commentaire acces
    row['commentaire_acces'] <- NULL
    row['2commentaire_acces'] <- NULL
    
    #cout acces
    row['cout_acces'] <- NULL
    row['2cout_acces'] <- NULL
    
    #Format mad
    row['format_mad'] <- NULL
    row['2format_mad'] <- NULL
    
    #commentaire format mad
    row['commentaire_format_mad'] <- NULL
    row['2commentaire_format_mad'] <- NULL
    
    #condition reutilisation
    row['condition_reutilisation'] <- NULL
    row['2condition_reutilisation'] <- NULL
    
    #lien
    if(row['portail_mad'] == "" && row['2portail_mad'] != ""){
      row['lien'] <- row['2portail_mad']
    }
    if(row['portail_mad'] != "" && row['2portail_mad'] == ""){
      row['lien'] <- row['portail_mad']
    }
    if(row['portail_mad'] != "" && row['2portail_mad'] != ""){
      row['lien'] <- row['2portail_mad']
    }
    
    row['portail_mad'] <- NULL
    row['2portail_mad'] <- NULL
    
    r <- POST("http://localhost:5000/bases", body = row,encode = "json")
  }
})
