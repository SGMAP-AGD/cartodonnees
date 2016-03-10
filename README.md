Cartographie Collaborative des Données de l'État
========================================================



La Cartographie Collaborative des Données de l'État est le référentiel de métadonnées de l'État Français. Cette initiative a pour but d'améliorer la qualité des données et d'en rationaliser la gouvernance au sein des administrations pour généraliser la mise en place de politiques fondées sur les données. 

La Cartographie Collaborative des Données de l'État est propose 3 niveaux de lecture:
  
  1. Un annuaire des gestionnaires de données de l'État, issu de l'annuaire de l'administration mis à jour par la DILA.
  2. Une liste à vocation exhaustive de toutes les bases de données de l'État, chacune reliée à son administration gestionnaire.
  3. Pour chaque base, une représentation complète et à jour de sa structure de données.
  
La cartographie a pour objectif est de distribuer des informations structurées, claires et pertinentes sur toutes les données de l'État, qu'elles soient ouvertes ou non. Seuls le niveau 2 est aujourd'hui publiés en Open Data sur la plateforme [Data.Gouv.fr](https://www.data.gouv.fr/fr/datasets/cartographie-collaborative-des-donnees-de-letat/).

## Gestionnaires de données

Les gestionnaires de données de l'État sont les entités répertoriées par l'annuaire de l'administration mis à jour par la [Direction Légale de l'Information Légale et Administrative](http://www.dila.premier-ministre.gouv.fr/) (DILA). Cet annuaire est consultable via une [interface web en ligne](https://lannuaire.service-public.fr) ou sous la forme d'un [jeu de données ouvert publié sur Data.gouv.fr](https://www.data.gouv.fr/fr/datasets/annuaire-des-services-publics-nationaux/). La dernière version de l'annuaire intégrée à la cartographie contient 3799 administrations.

Chaque entité de l'annuaire est rattachée à son administration parente, l'ensemble des administrations pouvant être représenté comme un graphe non orienté acyclique et connexe, ou arbre dont voici une représentation graphique:

[![administrations](reporting/administrations-thumb.png)](reporting/administrations.png)

Restent à intégrer:

* Les administrations territoriales de l'annuaire des services publics.
* Les [Groupements d'Intérêt Public](http://www.economie.gouv.fr/daj/gip), dont la liste est [publiée sur Legifrance](https://www.legifrance.gouv.fr/affichSarde.do?reprise=true&page=1&idSarde=SARDOBJT000007105856&ordre=null&nature=null&g=ls).

L'historisation de ces annuaires est prévue.

## Bases de données

La cartographie décrit [377 bases de données](http://bases.gouv2.fr/bases) pour [81 gestionnaires](http://bases.gouv2.fr/gestionnaires). Parmis ceux-ci, [39 gestionnaires](http://bases.gouv2.fr/gestionnaires/inconnus) ne sont pas encore identifiés dans l'annuaire des administrations.

### Sources

La liste des bases de données et leurs attributs est mise à jour automatiquement ainsi que de manière collaborative. Des [flux](scripts/) ont été développés pour intégrer différentes sources telles que les cartographies thématiques publiées en Open Data.

* [La cartographie des bases de données publiques en santé.](scripts/sante)
* [La cartographie des données publiques du logement](scripts/logement)

Pour l'enrichissement ponctuel de la cartographie, la modification du fichier [bases.json](data/bases.json) suivi d'une [pull request](https://help.github.com/articles/using-pull-requests/) sur le [répertoire Git de la cartographie](https://github.com/SGMAP-AGD/cartodonnees) est pour le moment nécéssaire. Ce fichier est [régulièrement intégré](scripts/import/import.R) au référentiel de la cartographie.

En raison de la diversité des sources, des données et informations incomplètes, incorrectes ou impertinentes sont suceptibles d'exister .

### Modèle de données 

Un modèle de données semi-structuré permet de décrire chaque base de données. Ce modèle évolue au fur et à mesure des mises à jour et de l'enrichissement de la cartographie. L'[API](http://bases.gouv2.fr/) de la cartographie permet de consulter le [modèle de données actuel brut](http://bases.gouv2.fr/bases/schema). Une [version documentée](data/schema.json) de ce schéma est également disponible.

#### Bases de données co-gérées

De nombreuses bases de données sont co-gérées par plusieurs administrations. Dans ce cas, le champ gestionnaire devient une liste contenant les co-gestionnaires.

### Représenter la cartographie

Considérées comme entitées dépendantes des leur gestionnaires, les bases de données peuvent être intégrées à l'arbre des administrations. La visualisation est alors similaire à celle de l'annuaire:

[![bases de données](reporting/cartographie-thumb.png)](reporting/cartographie.png)

### Intégration [data.gouv.fr](https://www.data.gouv.fr)

Le portail Open Data de l'État [data.gouv.fr](https://www.data.gouv.fr) recense les datasets, ou jeux de données ouverts de l'administration. Les gestionnaires y sont appelés producteurs. La cartographie collaborative des données permet de retracer la base d'origine des datasets sur le portail, lorsque le champ `datasets` de la cartographie est renseigné pour une base de données, et que la ou les chaînes de caractère qu'il contient sont conformes.

401 producteurs de données publient actuellement 21785 datasets sur [data.gouv.fr](https://www.data.gouv.fr). 40 producteurs sont présents dans l'annuaire des administrations, soit 9.98%.

## Structures des données

La documentation des structures de données des bases référencées ne sont pas encore à l'ordre du jour. Des expérimentations sont à venir, notamment sur quelques bases ouvertes tel que la [Base Adresse Nationale](https://adresse.data.gouv.fr/) et la présente cartographie.

## Structure technique de la cartographie

La cartographie collaborative est une base de données, à l'image des entitées qu'elle référence. À ce titre, elle est présente dans son propre référentiel, modélisée en suivant le même schéma que toutes les autres bases.
Bien que la cartographie des bases de données soit pour l'instant le seul dataset produit, la cartographie intègre d'autres sources.

* [L'annuaire des services publics](https://www.data.gouv.fr/fr/datasets/annuaire-des-services-publics-nationaux/) publié par la [DILA](http://www.dila.premier-ministre.gouv.fr/).
* [La liste de des jeux de données publiés sur le portail Data.gouv.fr](https://www.data.gouv.fr/fr/datasets.csv)

La cartographie dispose de copies de ces données le plus à jour possible, dont les versions font uniquement référence dans le cadre local de la cartographie. Ces versions ne sont pas publiées et les originaux doivent être la source de toute réutilisation.

## Feuille de route

* Schéma des métadonnées Niveau 2
  - Stabilisation du schéma.

* Gestionnaires de données
  - Historisation des administrations françaises.
  - Intégration des gestionnaires manquants.
  
* Data.gouv.fr
  - Harmonisation des gestionnaires/producteurs.
  - Intégration de la cartographie au portail data.gouv.fr.

* Portail Collaboratif
  - Définition d'un solution.
  - Déploiement de la solution retenue.
