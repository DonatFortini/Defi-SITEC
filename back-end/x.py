import pandas as pd
import re
import math
excel_file = pd.ExcelFile("back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx")
sheet_names = excel_file.sheet_names


def get_poubelles_for_village(village: str) -> list:
    data = pd.read_excel(
        "back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx", sheet_name=village)
    data = data.drop(['Unnamed: 0'], axis=1)
    gps = [parse_coordinates(data[i][1] if village != 'casta' else data["Unnamed: 2"][1])
           for i in data.columns if i.startswith('poubelle')]
    return gps


def dms_to_decimal(degrees: str, minutes: str, seconds: str, direction: str) -> float:
    '''convertit les coordonnées GPS en degrés décimaux'''
    decimal_degrees = float(degrees) + float(minutes) / \
        60 + float(seconds)/(60*60)
    decimal_degrees = - \
        decimal_degrees if direction in ['S', 'W'] else decimal_degrees
    return decimal_degrees


def parse_coordinates(coord_string: str) -> tuple:
    '''parse les coordonnées GPS au format DMS (degrés, minutes, secondes) et les retourne en degrés décimaux'''

    if '°' not in coord_string:
        return coord_string.split(',')[0], coord_string.split(',')[1]

    degrees = re.findall(r"(\d+)°", coord_string)
    minutes = re.findall(r'(\d+)\'', coord_string)
    seconds = re.findall(r'(\d+)"', coord_string)
    lat_dir = re.findall(r'([NSEW])+', coord_string)

    latitude = dms_to_decimal(degrees[0], minutes[0], seconds[0], lat_dir[0])
    longitude = dms_to_decimal(degrees[1], minutes[1], seconds[1], lat_dir[1])

    return latitude, longitude


dic = {}
for i in sheet_names:
    dic[i] = get_poubelles_for_village(i)

liste_ville=["rapale","pieve","sorio","san gavino di tenda","santu petro di tenda","casta","saint florent","farinole","patrimonio","BARBAGGIO","poggio oletta","oletta","olmeta di tuda","rutali","murato","vallecalle"]