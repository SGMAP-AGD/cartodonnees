Cartographie Collaborative des données de l'État
========================================================



### 
* La cartographie collaborative des données de l'État répertorie actuellement 362 bases de données pour 80 gestionnaires.

* La liste des administrations publiée sur l'annuaire des services publics comporte 0 doublons.

* 34 gestionnaires sont identifiés dans l'annuaire des services publics. 46 ne sont pas identifiés.


### Exemples de code

Mettre à jour un gestionnaire directement dans le référentiel:


```r
library(mongolite)
m <- mongo(collection = "bases",db="cartographie")

m$update("{ \"gestionnaire\": \"Institut National Du Cancer\" }",
         "{ \"$set\": { \"gestionnaire\": \"Institut national Du cancer\" } }",
         multiple = TRUE)
```
