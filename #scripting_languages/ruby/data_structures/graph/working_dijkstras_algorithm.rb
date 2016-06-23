# Dijkstra's algorithm


INT_MAX = Float::INFINITY
GRAPH_SIZE = 9

#
# find the index in the dist array with the minimum distance
#
def minDistance(dist, sptSet)  # sptSet - shortest path tree set
    min = INT_MAX
    min_index = nil  ### min_index = -100000 (old code)
    
    GRAPH_SIZE.times do |v| # loop through the nodes
        if sptSet[v] == false and dist[v] <= min  # if node not visited and its distance in less than the current minimum
            min = dist[v]  # set new minimum
            min_index = v # set current index with minimum distance
        end
    end
    return min_index
end

#
# print the distances from the nodes to the source
#
def printSolution( dist)
    puts("Vertex Distance from Source\n")
    GRAPH_SIZE.times do |i|
        puts("#{i} \t\t #{dist[i]}\n")
    end
end

#
#
#
def dijkstra( graph, src)
    dist = []
    sptSet = [] 

    GRAPH_SIZE.times do |i| # initialization
        dist[i] = INT_MAX # set all distances to INFINITY
        sptSet[i] = false # indentify nodes as NOT visited
    end

    # Distance of source node from itself is always 0
    dist[src] = 0

    # Find shortest path for all vertices
    (GRAPH_SIZE - 1).times do |count| # -1 because it excludes the source node ???
        # Pick node with the minimum distance to source, from the set of vertices not yet processed.
        # u is always equal to src in first iteration.
        u = minDistance(dist, sptSet)

        # Mark the picked node as processed
        sptSet[u] = true

        # Update dist value of the adjacent (neighbour) nodes of the picked node.
        GRAPH_SIZE.times do |v|
            # Update dist[v] (distance of v) only IF: 
            # - is not in sptSet (shortest path tree), 
            # - there is an edge from u to v, 
            # - and total weight of path from src to v through u is smaller than current value of dist[v]
            if  !sptSet[v] and graph[u][v] != 0 and dist[u] != INT_MAX and dist[u]+graph[u][v] < dist[v]
                dist[v] = dist[u] + graph[u][v]
            end
        end
    end

    # print the constructed distance array
    printSolution(dist)
end

# Let us create the example graph discussed above */
graph = [
    [0, 4, 0, 0, 0, 0, 0, 8, 0],
    [4, 0, 8, 0, 0, 0, 0, 11, 0],
    [0, 8, 0, 7, 0, 4, 0, 0, 2],
    [0, 0, 7, 0, 9, 14, 0, 0, 0],
    [0, 0, 0, 9, 0, 10, 0, 0, 0],
    [0, 0, 4, 0, 10, 0, 2, 0, 0],
    [0, 0, 0, 14, 0, 2, 0, 1, 6],
    [8, 11, 0, 0, 0, 0, 1, 0, 7],
    [0, 0, 2, 0, 0, 0, 6, 7, 0]
]

dijkstra(graph, 0)

=begin output:
Vertex Distance from Source
0        0
1        4
2        12
3        19
4        21
5        11
6        9
7        8
8        14
=end
