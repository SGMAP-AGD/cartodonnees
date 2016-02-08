# http://flask.pocoo.org/

# python3 api.py
# curl localhost:5000

#pip3 install Flask elasticsearch

from flask import Flask
from flask import request
import http

app = Flask(__name__)

conn = http.client.HTTPConnection("localhost", 9200)

@app.route("/")
def hello():
    return "API de la Cartographie collabortive des données de l'État v0"
    
@app.route("/bases", methods=['GET', 'POST'])
def bases():
    if request.method == 'GET':
        conn.request("GET","/nginx-logs")
        return conn.getresponse().read()
    else:
        return "Liste des bases"

if __name__ == "__main__":
    app.debug = True
    app.run()
