# http://flask.pocoo.org/

# python3 api.py
# curl localhost:5000

#pip3 install Flask elasticsearch

from flask import Flask
from flask import request
import pymongo

app = Flask(__name__)



@app.route("/")
def hello():
    return "API de la Cartographie collabortive des données de l'État v0"
    
@app.route("/bases", methods=['GET', 'POST'])
def bases():
    if request.method == 'POST':
      return "OK"
    else:
      return "bases"
        
if __name__ == "__main__":
    app.debug = True
    app.run()
