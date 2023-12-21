import numpy as np
import math

def dijkstra_algorithm(graph):
    num_vertices = len(graph)
    pre = [None] * num_vertices
    distances = [math.inf] * num_vertices
    visited = [False] * num_vertices

    distances[0] = 0

    def get_next_vertex():
        min_distance = math.inf
        next_vertex = None
        for i in range(num_vertices):
            if not visited[i] and distances[i] < min_distance:
                next_vertex = i
                min_distance = distances[i]
        return next_vertex

    def update_distances(vertex):
        for i in range(num_vertices):
            if graph[vertex, i] > 0 and not visited[i]:
                new_distance = distances[vertex] + graph[vertex, i]
                if new_distance < distances[i]:
                    distances[i] = new_distance
                    pre[i] = vertex

    current_vertex = get_next_vertex()
    while current_vertex is not None:
        visited[current_vertex] = True
        update_distances(current_vertex)
        current_vertex = get_next_vertex()

    return pre, distances, visited


graph = np.loadtxt("ressources/resau.txt")

predecessors, distances, visited = dijkstra_algorithm(graph)

print(predecessors)
print(distances)
print(visited)
