import pandas as pd
import numpy as np
from scipy.spatial.distance import euclidean
from itertools import permutations
from utils import parse_coordinates, total_distance
import datetime as date
from model import test_poubelle

liste_ville = ["rapale", "pieve", "sorio", "san gavino di tenda", "santu petro di tenda ", "casta", "saint florent ",
               "farinole", "patrimonio", "BARBAGGIO", "poggio oletta", "oletta", "olmeta di tuda", "rutali", "murato", "vallecalle"]

ville_coord = {"rapale": [42.580145, 9.2863423], "pieve": [42.5769588, 9.2849911], "sorio": [42.5836845, 9.2715395], "san gavino di tenda": [42.5984714, 9.264415], "santu petro di tenda ": [42.6049207, 9.2568983], "casta": [42.665677, 9.2145315], "saint florent ": [42.6818998, 9.30249815],
               "farinole": [42.7287137, 9.3589763], "patrimonio": [42.706535, 9.3685223], "BARBAGGIO": [42.679171, 9.3717053], "poggio oletta": [42.6400749, 9.3590751], "oletta": [42.6316296, 9.3590747], "olmeta di tuda": [42.6114908, 9.3526841], "rutali": [42.5799198, 9.3600481], "murato": [42.5778661, 9.326221], "vallecalle": [42.5992748, 9.3389631]}

all_trash = {}


def get_poubelles_for_village(village: str, date_: date.datetime) -> list[list]:
    '''retourne les coordonnées GPS des poubelles pour la commune passée en paramètre'''
    data = pd.read_excel(
        "back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx", sheet_name=village)
    data = data.drop(['Unnamed: 0'], axis=1)
    gps = [parse_coordinates(data[i][1] if village != 'casta' else data["Unnamed: 2"][1])
           for i in data.columns if i.startswith('poubelle')]
    ngps = []
    print(gps)
    for i in range(len(gps)):
        print(i+1)
        if not test_poubelle(i+1, village, date_):
            ngps.append(gps[i])
    print(ngps)
    return ngps


def get_last_dump(village: str, num_poubelle: int, date_: date.datetime) -> date.datetime:
    '''récupère la date du dernier vidange de la poubelle'''
    data = pd.read_excel(
        "back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx", sheet_name=village)
    drop = data[f"Unnamed: {num_poubelle*3}"]
    dates = data["Unnamed: 1"]
    date_index = dates[dates == date_].index[0]
    for i in range(0, date_index+1):
        if drop[i] == 0:
            return dates[i]


def get_trash_content(village: str, num_poubelle: int, date_: date.datetime) -> float:
    '''retourne le taux de remplissage de la poubelle'''
    data = pd.read_excel(
        "back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx", sheet_name=village)
    drop = data[f"Unnamed: {num_poubelle*3}"]
    dates = data["Unnamed: 1"]
    date_index = dates[dates == date_].index[0]
    return drop[date_index]


def get_village_coord(nom_village: str) -> list:
    '''retourne les coordonnées GPS du village passé en paramètre'''
    return ville_coord[nom_village]


def closest_village(coordinates: list) -> str:
    '''retourne le nom du village le plus proche des coordonnées passées en paramètre'''
    distances = [euclidean(coordinates, ville_coord[i]) for i in liste_ville]
    return liste_ville[np.argmin(distances)]


def add_trash(coordinates: list) -> None:
    '''ajoute une poubelle aux coordonnées passées en paramètre'''
    village = closest_village(coordinates)
    if all_trash.get(village) is not None:
        all_trash[village].append(coordinates)
    else:
        all_trash[village] = [coordinates]


def generate_path(coordinates: list[list], starting_point: list) -> list[list]:
    '''génère l'itinéraire de la tournée pour un village'''
    all_permutations = permutations(coordinates)
    min_distance = float('inf')
    optimal_order = None

    for perm in all_permutations:
        order = [starting_point] + list(perm)
        dist = total_distance(order)
        if dist < min_distance:
            min_distance = dist
            optimal_order = order

        return optimal_order[1:]


def generate_global_path(depot=[42.60080491507166, 9.322923935409024]) -> list[list]:
    '''génère l'itinéraire global de la tournée'''
    itineraire = []
    for i in liste_ville:
        if all_trash.get(i) is not None:
            all_trash[i] += get_poubelles_for_village(i)
        else:
            all_trash[i] = get_poubelles_for_village(i)
    new_starting_point = depot
    for i in liste_ville:
        village_it = generate_path(all_trash[i], new_starting_point)
        new_starting_point = village_it[-1]
        itineraire += village_it
    return itineraire


def empreinte_carbone_trajet(kilometrage: float) -> float:
    '''retourne l'empreinte carbone d'un trajet en camion poubelle en kgCO2e'''
    # Valeur fournie pour l'empreinte carbone d'un camion poubelle en kgCO2e/t.km
    empreinte_carbone_camion = 0.0711
    poids_camion_tonnes = 10
    return empreinte_carbone_camion * poids_camion_tonnes * kilometrage
