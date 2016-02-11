library(mongolite)

m <- mongo(collection = "bases",db="cartographie")

m$update("{ \"gestionnaire\": \"IRDES\" }",
      "{ \"$set\": { \"gestionnaire\": \"Institut de Recherche et de Documentation en Économie de la Santé\" } }")
m$update("{ \"gestionnaire\": \"ARS\" }",
         "{ \"$set\": { \"gestionnaire\": \"Agence Régionale de Santé\" } }")
m$update("{ \"gestionnaire\": \"IRDES\" }",
         "{ \"$set\": { \"gestionnaire\": \"Institut de Recherche et de Documentation en Économie de la Santé\" } }")
m$update("{ \"gestionnaire\": \"ANAH\" }",
         "{ \"$set\": { \"gestionnaire\": \"Agence Nationale de l'Habitat\" } }")
m$update("{ \"gestionnaire\": \"INCA\" }",
         "{ \"$set\": { \"gestionnaire\": \"Institut National Du Cancer\" } }")
m$update("{ \"gestionnaire\": \"ACPR\" }",
         "{ \"$set\": { \"gestionnaire\": \"Autorité de Contrôle Prudentiel et de Résolution\" } }")
m$update("{ \"gestionnaire\": \"SOeS\" }",
         "{ \"$set\": { \"gestionnaire\": \"Service de l'Observation et des Statistiques\" } }")
m$update("{ \"gestionnaire\": \"ADEME\" }",
         "{ \"$set\": { \"gestionnaire\": \"Agence de l'Environnement et de la Maîtrise de l'Énergie\" } }")
m$update("{ \"gestionnaire\": \"INSEE\" }",
         "{ \"$set\": { \"gestionnaire\": \"Institut National de la Statistique et des Études Économiques\" } }")
m$update("{ \"gestionnaire\": \"Institut national de la statistique et des études économiques\" }",
         "{ \"$set\": { \"gestionnaire\": \"Institut National de la Statistique et des Études Économiques\" } }")
m$update("{ \"gestionnaire\": \"CGEDD\" }",
         "{ \"$set\": { \"gestionnaire\": \"Conseil Général de l'Environnement et du Développement Durable\" } }")
m$update("{ \"gestionnaire\": \"ASIP Santé\" }",
         "{ \"$set\": { \"gestionnaire\": \"Agence des Systèmes d’Information Partagés de Santé\" } }")
m$update("{ \"gestionnaire\": \"Observatoire Régional de Santé (ORS)\" }",
         "{ \"$set\": { \"gestionnaire\": \"Observatoire Régional de Santé\" } }")
m$update("{ \"gestionnaire\": \"Ministère de l'écologie, du développement durable et de l'énergie\" }",
         "{ \"$set\": { \"gestionnaire\": \"Ministère de l'Écologie, du Développement durable et de l'Énergie\" } }")
m$update("{ \"gestionnaire\": \"CEGEDIM\" }",
         "{ \"$set\": { \"gestionnaire\": \"Cegedim\" } }")
m$update("{ \"gestionnaire\": \"Agence de la biomédecine\" }",
         "{ \"$set\": { \"gestionnaire\": \"Agence de la Biomédecine\" } }")
m$update("{ \"gestionnaire\": \"OMS\" }",
         "{ \"$set\": { \"gestionnaire\": \"Organisation Mondiale de la Santé\" } }")
m$update("{ \"gestionnaire\": \"INPI\" }",
         "{ \"$set\": { \"gestionnaire\": \"Institut National de la Propriété Industrielle\" } }")
m$update("{ \"gestionnaire\": \"FHF\" }",
         "{ \"$set\": { \"gestionnaire\": \"Fédération Hospitalière de France\" } }")
m$update("{ \"gestionnaire\": \"SOeS\" }",
         "{ \"$set\": { \"gestionnaire\": \"Service de l'Observation et des Statistiques\" } }")
m$update("{ \"gestionnaire\": \"DGALN\" }",
         "{ \"$set\": { \"gestionnaire\": \"Direction Générale de l'Aménagement, du Logement et de la Nature\" } }")
m$update("{ \"gestionnaire\": \"DGS\" }",
         "{ \"$set\": { \"gestionnaire\": \"Direction Générale de la Santé\" } }")
m$update("{ \"gestionnaire\": \"ANAH\" }",
         "{ \"$set\": { \"gestionnaire\": \"Agence Nationale de l'Habitat\" } }")
m$update("{ \"gestionnaire\": \"INSERM-CépiDC\" }",
         "{ \"$set\": { \"gestionnaire\": \"Centre d'Épidémiologie sur les Causes Médicales de Décès\" } }")
m$update("{ \"gestionnaire\": \"FRANCIM\" }",
         "{ \"$set\": { \"gestionnaire\": \"France Cancer Incidence et Mortalité\" } }")
m$update("{ \"gestionnaire\": \"Comité régional d'éducation pour la santé Provence-Alpes-Côte d'Azur\" }",
         "{ \"$set\": { \"gestionnaire\": \"Comité Régional d'Éducation pour la Santé Provence-Alpes-Côte d'Azur\" } }")
m$update("{ \"gestionnaire\": \"GROG\" }",
         "{ \"$set\": { \"gestionnaire\": \"Groupes Régionaux d'Observation de la Grippe\" } }")
m$update("{ \"gestionnaire\": \"CNAMTS\" }",
         "{ \"$set\": { \"gestionnaire\": \"Caisse Nationale de l'Assurance Maladie des Travailleurs Salariés\" } }")
m$update("{ \"gestionnaire\": \"Ecole des Hautes Etudes en Santé Publique (EHESP)\" }",
         "{ \"$set\": { \"gestionnaire\": \"Ecole des Hautes Études en Santé Publique\" } }")
