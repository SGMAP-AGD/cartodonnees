Cartographie Collaborative des Données de l'État
========================================================

La Cartographie Collaborative des Données de l'État est le référentiel de métadonnées de l'État Français. Cette initiative a pour but d'améliorer la qualité des données et d'en rationaliser la gouvernance au sein des administrations pour généraliser la mise en place de politiques fondées sur les données. 

La Cartographie Collaborative des Données de l'État est propose 3 niveaux de lecture:
  
  1. Un annuaire des gestionnaires de données de l'État, issu de l'annuaire de l'administration mis à jour par la DILA.
  2. Une liste à vocation exhaustive de toutes les bases de données de l'État, chacune reliée à son administration gestionnaire.
  3. Pour chaque base, une représentation complète et à jour de sa structure de données.
  
La cartographie a pour objectif est de distribuer des informations structurées, claires et pertinentes sur toutes les données de l'État, qu'elles soient ouvertes ou non. Seuls les niveaux 1 et 2 sont aujourd'hui publiés en Open Data sur la plateforme [Data.Gouv.fr](https://www.data.gouv.fr/fr/datasets/cartographie-collaborative-des-donnees-de-letat/).

Enrichie de manière collaborative, la cartographie dispose d'une multitude de sources hétérogènes comme les cartographies thématiques ouvertes ou les saisies manuelles effectuées à partir d'informations déstructurées. Des données incorrectes ou impertinentes sont donc suceptibles de subsister.



## Gestionnaires de données

Les gestionnaires de données de l'État sont les entités répertoriées par l'annuaire de l'administration mis à jour par la [Direction Légale de l'Information Légale et Administrative](http://www.dila.premier-ministre.gouv.fr/). Cet annuaire est consultable via une [interface web en ligne](https://lannuaire.service-public.fr) ou sous la forme d'un [jeu de données ouvert publié sur Data.gouv.fr](https://www.data.gouv.fr/fr/datasets/annuaire-des-services-publics-nationaux/). La dernière version de l'annuaire intégrée à la cartographie contient 3799 administrations.

Chaque entité de l'annuaire est rattachée à son administration parente, l'ensemble des administrations pouvant être représenté comme un graphe non orienté acyclique et connexe, ou arbre. En voici une représentation graphique:

[![administrations](reporting/administrations-thumb.png)](reporting/administrations.png)

## Bases de données

La cartographie décrit [370 bases de données](http://bases.gouv2.fr/bases) pour [76 gestionnaires](http://bases.gouv2.fr/gestionnaires). Parmis ceux-ci, [41 gestionnaires](http://bases.gouv2.fr/gestionnaires/inconnus) ne sont pas identifiés dans l'annuaire des administrations.

Considérées comme entitées dépendantes des leur gestionnaires, les bases de données peuvent être intégrées à l'arbre des administrations. La visualisation est alors similaire à celle de l'annuaire:

[![bases de données](reporting/cartographie-thumb.png)](reporting/cartographie.png)


### Conformité [Data.gouv.fr](https://www.data.gouv.fr)



## Structures des données
