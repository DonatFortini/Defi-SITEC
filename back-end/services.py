import pandas as pd
import numpy as np
from scipy.spatial.distance import euclidean
from scipy.spatial import distance_matrix
from scipy.optimize import linear_sum_assignment
import matplotlib.pyplot as plt
import seaborn as sns
import re
import datetime as date
import json
import requests
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler
from itertools import permutations
import math


data = pd.read_excel("Taux_Remplissage_ComCom_Nebbiu.xlsx")
data = data.drop(['Unnamed: 0'], axis=1)


def dms_to_decimal(degrees: str, minutes: str, seconds: str, direction: str) -> float:
    '''convertit les coordonnées GPS en degrés décimaux'''
    decimal_degrees = float(degrees) + float(minutes) / \
        60 + float(seconds)/(60*60)
    decimal_degrees = - \
        decimal_degrees if direction in ['S', 'W'] else decimal_degrees
    return decimal_degrees


def parse_coordinates(coord_string: str) -> tuple:
    '''parse les coordonnées GPS au format DMS (degrés, minutes, secondes) et les retourne en degrés décimaux'''
    degrees = re.findall(r"(\d+)°", coord_string)
    minutes = re.findall(r'(\d+)\'', coord_string)
    seconds = re.findall(r'(\d+)"', coord_string)
    lat_dir = re.findall(r'([NSEW])+', coord_string)

    latitude = dms_to_decimal(degrees[0], minutes[0], seconds[0], lat_dir[0])
    longitude = dms_to_decimal(degrees[1], minutes[1], seconds[1], lat_dir[1])

    return latitude, longitude


def get_village(village: str) -> pd.DataFrame:
    '''retourne les données de la commune passée en paramètre'''
    return data[data['Village'] == village]


def get_last_dump(village: str, poubelle: str) -> date.datetime:
    '''récupère la date du dernier vidange de la poubelle'''


def generate_route(coordinates,starting_point):
    def calculate_distance(point1, point2):
        return math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

    def total_distance(order):
        dist = 0
        for i in range(len(order) - 1):
            dist += calculate_distance(order[i], order[i + 1])
        return dist
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
