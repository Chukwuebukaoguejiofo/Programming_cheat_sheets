# http://www.geeksforgeeks.org/graph-and-its-representations/

# A C Program to demonstrate adjacency list representation of graphs

#include <stdio.h>
#include <stdlib.h>

# A structure to represent an adjacency list node
class AdjListNode
    attr_accessor :dest, :next
end

# A structure to represent an adjacency liat
class AdjList
    attr_accessor :head  # pointer to head node of list
end

# A structure to represent a graph. A graph is an array of adjacency lists.
# Size of array will be V (number of vertices in graph)
class Graph
    attr_accessor :v , :array
end

# A utility function to create a new adjacency list node
def new_adj_list_node(dest)
    new_node = AdjListNode.new
    new_node.dest = dest
    new_node.next = nil
    return new_node
end

# A utility function that creates a graph of v vertices
def createGraph(v)
    graph = Graph.new
    graph.v = v

    # Create an array of adjacency lists.  Size of array will be V
    graph.array = []  # (struct AdjList*) malloc(V * sizeof(struct AdjList));

     # Initialize each adjacency list as empty by making head as nil
    v.times do |i|
        adj_list = AdjList.new
        adj_list.head = nil
        graph.array[i] = adj_list
    end
    return graph
end

# Adds an edge to an undirected graph
def addEdge(graph, src, dest)
    # Add an edge from src to dest.  A new node is added to the adjacency
    # list of src.  The node is added at the begining
    new_node = new_adj_list_node(dest)
    new_node.next = graph.array[src].head
    graph.array[src].head = new_node

    # Since graph is undirected, add an edge from dest to src also
    new_node = new_adj_list_node(src)
    new_node.next = graph.array[dest].head
    graph.array[dest].head = new_node
end

# A utility function to print the adjacenncy list representation of graph
def printGraph(graph)
    graph.array.each_with_index do |v, index|
        pCrawl = v.head
        print "\n Adjacency list of vertex #{index}\n head"
        while (pCrawl) do
            print " -> #{pCrawl.dest}"
            pCrawl = pCrawl.next
        end
        puts
    end
end

# Driver program to test above functions
def main
    # create the graph given in above fugure
    @graph = createGraph(5)
    addEdge(@graph, 0, 1)
    addEdge(@graph, 0, 4)
    addEdge(@graph, 1, 2)
    addEdge(@graph, 1, 3)
    addEdge(@graph, 1, 4)
    addEdge(@graph, 2, 3)
    addEdge(@graph, 3, 4)

    # print the adjacency list representation of the above graph
    printGraph(@graph)

    return 0
end

main