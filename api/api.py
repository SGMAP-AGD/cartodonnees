# http://flask.pocoo.org/

from flask import Flask
from flask import request
from flask import Response
from pymongo import MongoClient
import json

app = Flask(__name__)

client = MongoClient()
db = client.cartographie

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
  
def getDicoSchema(dico):
  schema = {}
  for key,value in dico.items():
    if(str(type(value)) == "<class 'dict'>"):
      schema[key] = getDicoSchema(value)
    else: schema[key] = str(type(value))
  return schema
  
def APIerror(message):
  print(message)
  return message
  
@app.route("/")
def hello():
  # Retourne des informations sur l'API
  info = {}
  info["api"] = "Cartographie collaborative des données de l'État"
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
# Retourne le shcema d'un objet base
def basesSchema():
  bases = getListeBases()
  dico = {}
  for nom,base in bases.items():
    dico = dico.copy()
    dico.update(getDicoSchema(base))
  resultat = {"Nom de la base":dico}
  return Response(json.dumps(resultat, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')

@app.route("/gestionnaires", methods=['GET'])
# Retourne la liste des gestionnaires de base de données.
def gestionnaires():
  return Response(json.dumps(getGestionnaires(), indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
  
@app.route("/gestionnaires/bases", methods=['GET'])
# Retourne un dictionnaire des gestionnaires de base de données et de leurs bases.
def gestionnairesBases():
  gestionnaires = getGestionnaires()
  resultats = {}
  for gestionnaire in gestionnaires:
    bases = []
    for base in db.bases.find({"gestionnaire": gestionnaire}):
      bases.append(base["nom"])
    resultats[gestionnaire] = bases
  return Response(json.dumps(resultats, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
      
if __name__ == "__main__":
    app.debug = True
    app.run()
