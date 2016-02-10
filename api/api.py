# http://flask.pocoo.org/

# python3 api.py
# curl localhost:5000
# pip3 install Flask elasticsearch
# curl http://localhost:5000/bases -X POST --data "{\"nom\":\"Base de données de test\",\"gestionnaire\":\"Gestionnaire de test\"}"  --header 'content-type:application/json'
# curl http://localhost:5000/bases

from flask import Flask
from flask import request
from flask import Response
from pymongo import MongoClient
import json

app = Flask(__name__)

client = MongoClient()
db = client.cartographie

@app.route("/")
def hello():
    return "API de la Cartographie collabortive des données de l'État v0"
    
@app.route("/bases", methods=['GET', 'POST'])
def bases():
    if request.method == 'POST':
      print(request.data)
      if('nom' in request.json):
        print(request.json)
        if('gestionnaire' in request.json):
          # Vérifier si le nom et le gestionnaire sont renseignés
          if(existeBase(request.json["nom"]) == False):
            inserted_id = db.bases.insert_one(request.json).inserted_id
            return str(inserted_id)
          else:
            return "La base de données existe déjà."
        else:
          return "Le gestionnaire de la base doit être renseigné."
      else:
        return "Le nom de la base doit être renseigné."
    else:
      return getListeBases()

#@app.route("/gestionnaires", methods=['GET'])

def existeBase(nom):
  # Pour savoir si une base de données est déjà référencée
  if (db.bases.find_one({"nom": nom}) == None):
    return False
  else:
    return True
    
def getListeBases():
  # Retourne la liste des bases
  resultats = dict()
  for base in db.bases.find():
    del base["_id"]
    nom = base["nom"]
    del base["nom"]
    resultats[nom] = base
  print(bases)  
  return Response(json.dumps(resultats, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
        
if __name__ == "__main__":
    app.debug = True
    app.run()
