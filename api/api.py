# http://flask.pocoo.org/

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
  # Retourne des informations sur l'API
  info = {}
  info["api"] = "Cartographie collaborative des données de l'État v0"
  info["version"] = "0.0.1"
  return Response(json.dumps(info, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
    
@app.route("/bases", methods=['GET', 'POST'])
def bases():
    if request.method == 'POST':
      if('nom' in request.json):
        if('gestionnaire' in request.json):
          # Vérifier si le nom et le gestionnaire sont renseignés
          if(existeBase(request.json["nom"]) == False):
            inserted_id = db.bases.insert_one(request.json).inserted_id
            return str(inserted_id)
          else:
            return APIerror("La base de données existe déjà.")
        else:
          return APIerror("Le gestionnaire de la base doit être renseigné.")
      else:
        return APIerror("Le nom de la base doit être renseigné.")
    else:
      return Response(json.dumps(getListeBases(), indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
      
@app.route("/bases/schema", methods=['GET'])
def basesSchema():
  bases = getListeBases()
  dico = {"Nom de la base":{}}
  for nom,base in bases.items():
    for key,value in base.items():
      dico["Nom de la base"][key] = str(type(value))
  return Response(json.dumps(dico, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')

@app.route("/gestionnaires", methods=['GET'])
# Retourne la liste des gestionnaires de base de données
def gestionnaires():
  return Response(json.dumps(getGestionnaires(), indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
  
@app.route("/gestionnaires/bases", methods=['GET'])
def gestionnairesBases():
  gestionnaires = getGestionnaires()
  resultats = {}
  for gestionnaire in gestionnaires:
    bases = []
    for base in db.bases.find({"gestionnaire": gestionnaire}):
      bases.append(base["nom"])
    resultats[gestionnaire] = bases
  return Response(json.dumps(resultats, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')

def getGestionnaires():
  return db.bases.distinct("gestionnaire")
  
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
  return resultats
  
def APIerror(message):
  print(message)
  return message
        
if __name__ == "__main__":
    app.debug = True
    app.run()
