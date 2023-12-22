from app import app
from services import *


@app.route('/', methods=['GET'])
def hello():
    return 'Hello, World!'


@app.route('/api/getMap/<date_>', methods=['GET'])
def getMap(date_: str) -> list[list]:
    return generate_global_path(date.datetime(int(date_.split('-')[0]), int(date_.split('-')[1]), int(date_.split('-')[2]), 0, 0, 0))


@app.route('/api/getVillageCoord/<nom_village>', methods=['GET'])
def getVillageCoord(nom_village: str) -> list:
    return get_village_coord(nom_village)


@app.route('/api/getTrash/<nom_village>/<date_>', methods=['GET'])
def getTrash(nom_village: str, date_: str) -> list[list]:
    return get_poubelles_for_village(nom_village, date.datetime(int(date_.split('-')[0]), int(date_.split('-')[1]), int(date_.split('-')[2]), 0, 0, 0))


@app.route('/api/getLastDump/<nom_village>/<num_poubelle>/<date_>', methods=['GET'])
def getLastDump(nom_village: str, num_poubelle: int, date_: date.datetime) -> date.datetime:
    return get_last_dump(nom_village, num_poubelle, date_)


@app.route('/api/getClosestVillage/<coordinates>', methods=['GET'])
def getClosestVillage(coordinates: list) -> str:
    return closest_village(coordinates)


@app.route('/api/generateRoute/<coordinates>/<starting_point>', methods=['GET'])
def generateRoute(coordinates: list[list], starting_point: list):
    return generate_path(coordinates, starting_point)


@app.route('/api/data/getAllTrash', methods=['GET'])
def getAllTrash() -> dict:
    return all_trash


@app.route('/api/data/getAllTrashContent/<nom_village>/<num_poubelle>/<date_>', methods=['GET'])
def getAllTrashContent(nom_village: str, num_poubelle: int, date_: date.datetime) -> float:
    return get_trash_content(nom_village, num_poubelle, date_)


@app.route('/api/data/getAllVillage', methods=['GET'])
def getAllVillage() -> list:
    return liste_ville


@app.route('/api/data/getAllVillageCoord', methods=['GET'])
def getAllVillageCoord() -> dict:
    return ville_coord


@app.route('/api/data/EmpreinteCO2/<kilometrage>', methods=['GET'])
def getEmpreinteCO2(kilometrage: str) -> str:
    return empreinte_carbone_trajet(float(kilometrage))
