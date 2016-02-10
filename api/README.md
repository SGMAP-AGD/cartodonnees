# API de la Cartographie Collaborative des Données de l'État

L'API de la Cartographie Collaborative des Données de l'État permet d'ajouter, de mettre à jour et de consulter les informations relatives aux données gérées par l'État. Les données sont organisées selon un [modèle semi-structuré](http://homepages.inf.ed.ac.uk/opb/papers/PODS1997a.pdf). Chaque base de données est représentée par un document contenant des attributs: un nom et un gestionnaire à minima.

## Récupérer les données l'API

### Bases de données

/bases

### Gestionnaires

/gestionnaires

## Mettre à jour les données de l'API

/bases

## Architecture technique

Cette API s'appuie sur le microFramework Python Flask et la base de données MongoDB.
