library(rjson)
library(rmongodb)
library(plyr)

# Importer le JSON de base
bases <- fromJSON(paste(readLines("data/bases.json"), collapse=""))

mongo <- mongo.create()

mongo.drop(mongo,"cartographie.bases")

basesb <- lapply(names(bases), function(nom) {
  base <- bases[nom][[1]]
  base['nom'] <- nom
  #print(base['datasets'])
  return(mongo.bson.from.list(base))
})

mongo.insert.batch(mongo, "cartographie.bases", basesb)

mongo.destroy(mongo)
