# Intégration data.gouv.fr

# Téléchargement du dump https://www.data.gouv.fr/fr/datasets.csv

datasets <- read.csv2("data/datasets.csv")
datasets$organization <- as.character(datasets$organization)
datasets$slug <- as.character(datasets$slug)
datasets$title <- as.character(datasets$title)

mongo <- mongo.create()

datasetsl <- mongo.bson.from.df(datasets)

mongo.drop(mongo,"cartographie.datasets")

mongo.insert.batch(mongo, "cartographie.datasets", datasetsl)

mongo.destroy(mongo)
