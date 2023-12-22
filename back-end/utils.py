import re
import math

def calculate_distance(point1, point2):
        return math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

def total_distance(order):
    dist = 0
    for i in range(len(order) - 1):
        dist += calculate_distance(order[i], order[i + 1])
    return dist

def dms_to_decimal(degrees: str, minutes: str, seconds: str, direction: str) -> float:
    '''convertit les coordonnées GPS en degrés décimaux'''
    decimal_degrees = float(degrees) + float(minutes) / \
        60 + float(seconds)/(60*60)
    decimal_degrees = - \
        decimal_degrees if direction in ['S', 'W'] else decimal_degrees
    return decimal_degrees


def parse_coordinates(coord_string: str) -> list:
    '''parse les coordonnées GPS au format DMS (degrés, minutes, secondes) et les retourne en degrés décimaux'''

    if '°' not in coord_string:
        return [float(coord_string.split(',')[0]), float(coord_string.split(',')[1])]

    degrees = re.findall(r"(\d+)°", coord_string)
    minutes = re.findall(r'(\d+)\'', coord_string)
    seconds = re.findall(r'(\d+)"', coord_string)
    lat_dir = re.findall(r'([NSEW])+', coord_string)

    latitude = dms_to_decimal(degrees[0], minutes[0], seconds[0], lat_dir[0])
    longitude = dms_to_decimal(degrees[1], minutes[1], seconds[1], lat_dir[1])

    return [latitude, longitude]
