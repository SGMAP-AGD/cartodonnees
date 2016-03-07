Cartographie Collaborative des Données de l'État
========================================================




La Cartographie Collaborative des Données de l'État est le référentiel de métadonnées de l'État Français. Cette initiative a pour but d'améliorer la qualité des données et d'en rationaliser la gouvernance au sein des administrations pour généraliser la mise en place de politiques fondées sur les données. 

La Cartographie Collaborative des Données de l'État est propose 3 niveaux de lecture:
  
  1. Un annuaire des gestionnaires de données de l'État, issu de l'annuaire de l'administration mis à jour par la DILA.
  2. Une liste à vocation exhaustive de toutes les bases de données de l'État, chacune reliée à son administration gestionnaire.
  3. Pour chaque base, une représentation complète et à jour de sa structure de données.
  
La cartographie a pour objectif est de distribuer des informations structurées, claires et pertinentes sur toutes les données de l'État, qu'elles soient ouvertes ou non. Seuls les niveaux 1 et 2 sont aujourd'hui publiés en Open Data sur la plateforme [Data.Gouv.fr](https://www.data.gouv.fr/fr/datasets/cartographie-collaborative-des-donnees-de-letat/).

### Alimentation

Enrichie de manière collaborative à la manière de ce document, la cartographie dispose d'une multitude de sources hétérogènes comme les cartographies thématiques ouvertes ou les saisies manuelles effectuées à partir d'informations déstructurées. Des données et informations incomplètes, incorrectes ou impertinentes sont donc suceptibles d'exister.

### Structure technique

La cartographie collaborative est une base de données, à l'image des entitées qu'elle référence. À ce titre, elle est présente dans son propre référentiel, modélisée en suivant le même schéma que toutes les autres bases.
Bien que la cartographie des bases de données soit pour l'instant le seul jeu de données produit, la cartographie intègre d'autres sources de données.

* L'annuaire des services publics publié par la DILA.
* La liste de des jeux de données publiés sur le portail Data.gouv.fr

La cartographie dispose de copies de ces données, faisant uniquement référence dans un cadre local. Elles ne sont donc pas publiées et les sources originales doivent être considérées pour toute réutilisation.

## Gestionnaires de données

Les gestionnaires de données de l'État sont les entités répertoriées par l'annuaire de l'administration mis à jour par la [Direction Légale de l'Information Légale et Administrative](http://www.dila.premier-ministre.gouv.fr/). Cet annuaire est consultable via une [interface web en ligne](https://lannuaire.service-public.fr) ou sous la forme d'un [jeu de données ouvert publié sur Data.gouv.fr](https://www.data.gouv.fr/fr/datasets/annuaire-des-services-publics-nationaux/). La dernière version de l'annuaire intégrée à la cartographie contient 3799 administrations.

Chaque entité de l'annuaire est rattachée à son administration parente, l'ensemble des administrations pouvant être représenté comme un graphe non orienté acyclique et connexe, ou arbre. En voici une représentation graphique:

[![administrations](reporting/administrations-thumb.png)](reporting/administrations.png)

L'historisation de cet annuaire est prévue.

## Bases de données

La cartographie décrit [369 bases de données](http://bases.gouv2.fr/bases) pour [76 gestionnaires](http://bases.gouv2.fr/gestionnaires). Parmis ceux-ci, [40 gestionnaires](http://bases.gouv2.fr/gestionnaires/inconnus) ne sont pas identifiés dans l'annuaire des administrations. Il s'agit d'établissements publics ou d'administrations territoriales n'ayant pas encore été intégrées à la cartographie.

Un modèle de données semi-structuré permet de décrire chaque base de données. Ce modèle évolue au fur et à mesure des mises à jour et de l'enrichissement de la cartographie. L'[API](http://bases.gouv2.fr/) de la cartographie permet de consulter le [modèle de données actuel brut](http://bases.gouv2.fr/bases/schema). Une [version documentée](data/schema.json) est également disponible.

### Représenter la cartographie

Considérées comme entitées dépendantes des leur gestionnaires, les bases de données peuvent être intégrées à l'arbre des administrations. La visualisation est alors similaire à celle de l'annuaire:

[![bases de données](reporting/cartographie-thumb.png)](reporting/cartographie.png)

### Intégration [data.gouv.fr](https://www.data.gouv.fr)

Le portail Open Data de l'État [data.gouv.fr](https://www.data.gouv.fr) recense les jeux de données ouverts de l'administration. La cartographie collaborative des données permet de retracer la base d'origine des jeux de données publiés sur le portail, lorsque le champ `datagouv` est renseigné.

## Structures des données



## Feuille de route

* Schéma des métadonnées Niveau 2
  - Stabilisation du schéma intermédiaire pour une "v1".

* Gestionnaires de données
  - Historisation des administrations françaises.
  - Intégration des gestionnaires manquants.
  
* Data.gouv.fr
  - Harmonisation des gestionnaires/producteurs.
  - Intégration de la cartographie au portail data.gouv.fr.

* Portail Collaboratif Public
  - Définition d'un solution.
  - Déploiement de la solution retenue.
