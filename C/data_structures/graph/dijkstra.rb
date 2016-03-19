# ssdf

=begin
/ A C / C++ program for Dijkstra's single source shortest path algorithm.
# The program is for adjacency matrix representation of the graph

#include <stdio.h>
#include <limits.h>
=end

# Number of vertices in the graph
V = 9

INT_MAX = 999



# A utility function to find the vertex with minimum distance value, from
# the set of vertices not yet included in shortest path tree
def minDistance(dist, sptSet)
   # Initialize min value
    min = INT_MAX #, min_index

    v = 0

    while v < V do
        if (sptSet[v] == false && dist[v] <= min)
            min = dist[v], min_index = v
            v += 1
        end
    end

   return min_index
end

# A utility function to print the constructed distance array
def printSolution( dist,  n)
    print("Vertex   Distance from Source\n")
    i = 0
    while  i < V do
        print("#{i} \t\t #{dist[i]}\n")
        i += 1
    end
end

# Funtion that implements Dijkstra's single source shortest path algorithm
# for a graph represented using adjacency matrix representation
def dijkstra( graph, src)
puts "aaa"
    dist = []     # The output array.  dist[i] will hold the shortest
                      # distance from src to i

    sptSet = [] # sptSet[i] will true if vertex i is included in shortest
                     # path tree or shortest distance from src to i is finalized

    # Initialize all distances as INFINITE and stpSet[] as false

    i = 0
    while ( i < V)
        dist[i] = INT_MAX, sptSet[i] = false
    end

     # Distance of source vertex from itself is always 0
     dist[src] = 0

     # Find shortest path for all vertices
     count = 0
     while (count < V - 1 )

       # Pick the minimum distance vertex from the set of vertices not
       # yet processed. u is always equal to src in first iteration.
        u = minDistance(dist, sptSet)

       # Mark the picked vertex as processed
       sptSet[u] = true

       # Update dist value of the adjacent vertices of the picked vertex.
       v = 0
       while ( v < V )

         # Update dist[v] only if is not in sptSet, there is an edge from
         # u to v, and total weight of path from src to  v through u is
         # smaller than current value of dist[v]
         if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX  && dist[u]+graph[u][v] < dist[v])
            dist[v] = dist[u] + graph[u][v]
        end
     end
        count += 1
     end

     # print the constructed distance array
     printSolution(dist, V)
end

# driver program to test above function
# def main()
   # Let us create the example graph discussed above */

    graph = []
    graph = [[0, 4, 0, 0, 0, 0, 0, 8, 0],
                      [4, 0, 8, 0, 0, 0, 0, 11, 0],
                      [0, 8, 0, 7, 0, 4, 0, 0, 2],
                      [0, 0, 7, 0, 9, 14, 0, 0, 0],
                      [0, 0, 0, 9, 0, 10, 0, 0, 0],
                      [0, 0, 4, 0, 10, 0, 2, 0, 0],
                      [0, 0, 0, 14, 0, 2, 0, 1, 6],
                      [8, 11, 0, 0, 0, 0, 1, 0, 7],
                      [0, 0, 2, 0, 0, 0, 6, 7, 0]
                     ];

    dijkstra(graph, 0)

    return 0
# end


# main


# Run on IDE
# Output:

# Vertex   Distance from Source
# 0                0
# 1                4
# 2                12
# 3                19
# 4                21
# 5                11
# 6                9
# 7                8
# 8                14