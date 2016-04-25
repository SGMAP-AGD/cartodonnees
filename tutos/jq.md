
## Tutoriel pour parcourir les données

Parcourir le json:

    $ jq '.' data/bases.json

Lister les bases de données :

    $ jq 'keys' data/bases.json

Regarder une base particulière (par exemple Code Officiel Géographique) :

    $ jq '.["Code Officiel Géographique"]' data/bases.json
    $ jq '.TREIMA2' data/bases.json

Obtenir la valeur d'une variable pour une variable (par exemple, la valeur d'acronyme pour le code géographique officiel)

    $ jq '.["Code Officiel Géographique"] | .acronyme' data/bases.json

Obtenir la liste des acronymes :

    $ jq '.[] | .acronyme' data/bases.json

Obtenir la liste des gestionnaires :

    $ jq '.[] | .gestionnaire' data/bases.json

Obtenir la liste des gestionnaires et des acronymes :

    $ jq '.[] | [.gestionnaire, .acronyme]' data/bases.json
    $ jq '.[] | {gestionnaire: .gestionnaire,acronyme: .acronyme}' data/bases.json

Obtenir la liste des bases pour un gestionnaire :

    $ jq '.[] | select(.gestionnaire == "Institut national du cancer")' data/bases.json

## Ressources

* [Tutorial](https://stedolan.github.io/jq/tutorial/)
