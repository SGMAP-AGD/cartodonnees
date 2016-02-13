# Crée un arbre JSON à partir de administrations.txt
import json

etat = {"nom":"État", "children":[]}

administrations = []
niveauMax = 0
with open("data/administrations.txt") as f:
  for ligne in f.readlines():
    ligne = ligne.replace("\n", "")
    ligne = ligne.split(" | ")
    administrations.append(ligne)
    if len(ligne) > niveauMax: niveauMax = len(ligne)

# Niveau 1
for ligne in  administrations:
  estPresent = False
  for children in etat["children"]:
    if children["nom"] == ligne[0]:
      estPresent = True
  if estPresent == False:
    etat["children"].append({"nom":ligne[0], "children":[]})

# Niveau 2
for ligne in  administrations:
  if len(ligne) >= 2:
    for level1 in etat["children"]:
      if level1["nom"] == ligne[0]:
        estPresent = False
        for children in level1["children"]:
          if children["nom"] == ligne[1]:
            estPresent = True
        if estPresent == False:
          level1["children"].append({"nom":ligne[1], "children":[]})

# Niveau 3
for ligne in  administrations:
  if len(ligne) >= 3:
    for level1 in etat["children"]:
      if level1["nom"] == ligne[0]:
        for level2 in level1["children"]:
          if level2["nom"] == ligne[1]:
            estPresent = False
            for children in level2["children"]:
              if children["nom"] == ligne[2]:
                estPresent = True
            if estPresent == False:
              level2["children"].append({"nom":ligne[2], "children":[]})
          
# Niveau 4
for ligne in  administrations:
  if len(ligne) >= 4:
    for level1 in etat["children"]:
      if level1["nom"] == ligne[0]:
        for level2 in level1["children"]:
          if level2["nom"] == ligne[1]:
            for level3 in level2["children"]:
              if level3["nom"] == ligne[2]:
                estPresent = False
                for children in level3["children"]:
                  if children["nom"] == ligne[3]:
                    estPresent = True
                if estPresent == False:
                  level3["children"].append({"nom":ligne[3], "children":[]})   

# Niveau 5
for ligne in  administrations:
  if len(ligne) >= 5:
    for level1 in etat["children"]:
      if level1["nom"] == ligne[0]:
        for level2 in level1["children"]:
          if level2["nom"] == ligne[1]:
            for level3 in level2["children"]:
              if level3["nom"] == ligne[2]:
                for level4 in level3["children"]:
                  if level4["nom"] == ligne[3]:
                    estPresent = False
                    for children in level3["children"]:
                      if children["nom"] == ligne[4]:
                        estPresent = True
                    if estPresent == False:
                      level4["children"].append({"nom":ligne[4], "children":[]})   
                  
etat = json.dumps(etat, indent= 2,ensure_ascii=False)

print(etat)

file = open('reporting/visualisation/administrations.json','w')
file.write(etat)
file.close()
