# Crée un arbre JSON à partir de administrations.txt

etat = {}

administrations = []
niveauMax = 0
with open("data/administrations.txt") as f:
  for ligne in f.readlines():
    ligne = ligne.replace("\n", "")
    ligne = ligne.split(" | ")
    administrations.append(ligne)
    if len(ligne) > niveauMax: niveauMax = len(ligne)

for niveau in range(0, niveauMax):
  print(niveau)
  #for ligne in  administrations:
  #  if(len(ligne) < niveau+1):
  #    print(ligne[niveau])

