from itertools import permutations
import math

def calculate_distance(point1, point2):
    return math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

def total_distance(order):
    dist = 0
    for i in range(len(order) - 1):
        dist += calculate_distance(order[i], order[i + 1])
    return dist

starting_point = [42.60080491507166, 9.322923935409024]
coordinates = [
    [42.61083333333333, 9.35388888888889], [42.61222222222222, 9.356666666666666],
    [42.61416666666667, 9.354722222222222], [42.61527777777778, 9.351388888888888],
    [42.61694444444444, 9.355555555555556], [42.608333333333334, 9.358055555555556],
    [42.60194444444445, 9.359722222222222]
]

# Generate all possible permutations of the coordinates
all_permutations = permutations(coordinates)

# Find the permutation with the minimum total distance
min_distance = float('inf')
optimal_order = None

for perm in all_permutations:
    order = [starting_point] + list(perm) 
    dist = total_distance(order)
    if dist < min_distance:
        min_distance = dist
        optimal_order = order

print("Optimal Order:", optimal_order[1:])
print("Minimum Total Distance:", min_distance)
