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
    return "API de la Cartographie collabortive des données de l'État v0"
    
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
      return getListeBases()

@app.route("/gestionnaires", methods=['GET'])
# Retourne la liste des gestionnaires de base de données
def gestionnaires():
  return getGestionnaires()
  
@app.route("/schema", methods=['GET'])
# Retourne la structure des documents 
def schema():
  resultats = db.bases.find()
  return "structure"
  
def getGestionnaires():
  resultats = db.bases.distinct("gestionnaire")
  return Response(json.dumps(resultats, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
  
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
  return Response(json.dumps(resultats, indent= 2,ensure_ascii=False),mimetype='application/json; charset=utf-8')
  
def APIerror(message):
  print(message)
  return message
        
if __name__ == "__main__":
    app.debug = True
    app.run()
