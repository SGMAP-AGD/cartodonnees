# Intégration data.gouv.fr

# Téléchargement du dump https://www.data.gouv.fr/fr/datasets.csv

datasets <- read.csv2("data/datasets.csv")

mongo <- mongo.create()

datasets <- mongo.bson.from.df(datasets)

mongo.drop(mongo,"cartographie.datasets")

mongo.insert.batch(mongo, "cartographie.datasets", datasets)

mongo.destroy(mongo)
