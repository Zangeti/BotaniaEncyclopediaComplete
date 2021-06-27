import os

with open("plantInfo-clean.csv", "r", encoding="utf-8") as f:
    csv = f.readlines()

res = "import './util.dart';\n\nfinal List<PlantIdentifier> plants = [\n"

for line in csv[1:]:
    longdata = line.split(",")
    data = []
    for piece in longdata:
        if piece.strip() != "":
            if piece[0] == " " or piece[len(piece) - 1] == " ":
                data[len(data) - 1] += "," + piece
            else:
                data.append(piece)
        else:
            data.append("")
        
    res += "\tPlantIdentifier('" + data[0].replace('"', '').replace("'", "\\'").strip() + "', '" + data[1].replace('"', '').replace("'", "\\'").strip() + "', '" + data[2].replace('"', '').replace("'", "\\'").strip() + "', '" + data[3].replace('"', '').replace("'", "\\'").strip() + "', '" + data[4].replace('"', '').replace("'", "\\'").strip() + "', '" + data[5].replace('"', '').replace("'", "\\'").strip() + "', '" + data[6].replace('"', '').replace("'", "\\'").strip() + "', '" + data[7].replace('"', '').replace("'", "\\'").strip() + "', '" + data[8].replace('"', '').replace("'", "\\'").strip() + "', '" + data[9].replace('"', '').replace("'", "\\'").strip() + "'),\n"

res += "];"

open("out.dart", "w", encoding="utf-8").write(res)
