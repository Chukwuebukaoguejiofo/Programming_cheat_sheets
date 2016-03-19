# A C / C++ program for Dijkstra's single source shortest path algorithm.
# The program is for adjacency matrix representation of the graph

#include <stdio.h>
#include <limits.h>

# Number of vertices in the graph
V = 9
INT_MAX = 9999
@predecessor = []

@graph = [
    [999,   999,    1,  999,    999,    999,    999,    999,    10,    ],
    [999,   999,    999,    1,  999,    999,    999,    999,    2,  ],
    [1,     999,    999,    999,    1,  999,    999,    999,    999,    ],
    [999,   1,  999,    999,    999,    999,    999,    999,    999,    ],
    [999,   999,    1,  999,    999,    999,    1,  999,    999,    ],
    [999,   999,    999,    999,    999,    999,    999,    999,    999,    ],
    [999,   999,    999,    999,    1,  999,    999,    999,    1,  ],
    [999,   999,    999,    999,    999,    999,    999,    999,    999,    ],
    [999,   1,  999,    999,    999,    999,    1,  999,    999,    ],
]

def debug(x)
  # puts "-----------------------------"
  puts x
  # puts "-----------------------------"
end

#---------------------------------------------------------------------------
# A utility function to find the vertex with minimum distance value, from
# the set of vertices not yet included in shortest path tree
def minDistance(dist, sptSet)  # its all about the index in these two arrays = dist and sptSet !!! <----
  # Initialize min value
  min = INT_MAX
  #, min_index;

  v = 0
  while (v < V) do
    if sptSet[v] == false && dist[v] <= min
      min = dist[v]
      min_index = v
    end
    v += 1
  end
   # return min_index
   min_index
end
#---------------------------------------------------------------------------
# A utility function to print the constructed distance array
def printSolution(dist,  n)
   print("Vertex   Distance from Source\n")
   i = 0
   while ( i < V) do
      printf("#{i} \t\t #{dist[i]}\n")
      i += 1
   end
end
#---------------------------------------------------------------------------
# Funtion that implements Dijkstra's single source shortest path algorithm
# for a graph represented using adjacency matrix representation
def dijkstra(graph, src)
     dist = []     # The output array.  dist[i] will hold the shortest
                      # distance from src to i

     sptSet = [] # sptSet[i] will true if vertex i is included in shortest
                     # path tree or shortest distance from src to i is finalized

     # Initialize all distances as INFINITE and stpSet[] as false
     i = 0
     while ( i < V) do
        dist[i] = INT_MAX
        sptSet[i] = false
        i += 1
     end

     # Distance of source vertex from itself is always 0
     dist[src] = 0

     # Find shortest path for all vertices
     count = 0
     while (count < V - 1) do

       # Pick the minimum distance vertex from the set of vertices not
       # yet processed. u is always equal to src in first iteration.


       u = minDistance(dist, sptSet)

       #debug "----------------------------------- Index #{count} minDistance == #{u}"


       # Mark the picked vertex as processed
       sptSet[u] = true
# debug count
# debug sptSet
       # Update dist value of the adjacent vertices of the picked vertex.
       v = 0
       while ( v < V) do

         # Update dist[v] only if is not in sptSet, there is an edge from
         # u to v, and total weight of path from src to  v through u is
         # smaller than current value of dist[v]


         if (!sptSet[v] and graph[u][v] != 0 and dist[u] != INT_MAX and dist[u] + graph[u][v] < dist[v])
         # debug "---------- Vertex(#{v}) \n graph[#{u}][#{v}] #{graph[u][v]}   \n dist[#{u}] == #{dist[u]}"
         # debug " OLD distance #{dist[v]}"
            dist[v] = dist[u] + graph[u][v]

            # predecessor
            @predecessor[u] = v  # ?


            #debug " NEW distance #{dist[v]}"

         end
         v += 1
       end
       count += 1
     end

     # print the constructed distance array
     printSolution(dist, V)

     #debug dist
end
#---------------------------------------------------------------------------
# driver program to test above function
def main()

   # Let us create the example graph discussed above */

   # graph = [  #0  1  2  3  4  5  6  7  8
   #            [0, 4, 0, 0, 0, 0, 0, 8, 0],
   #                    [4, 0, 8, 0, 0, 0, 0, 11, 0],
   #                    [0, 8, 0, 7, 0, 4, 0, 0, 2],
   #                    [0, 0, 7, 0, 9, 14, 0, 0, 0],
   #                    [0, 0, 0, 9, 0, 10, 0, 0, 0],
   #                    [0, 0, 4, 0, 10, 0, 2, 0, 0],
   #                    [0, 0, 0, 14, 0, 2, 0, 1, 6],
   #                    [8, 11, 0, 0, 0, 0, 1, 0, 7],
   #                    [0, 0, 2, 0, 0, 0, 6, 7, 0]


   #         ]

  #---------------------------------------------------------------------------
   # graph = [
   #        #  0  1   2
   #          [0,200,8],  # 0
   #          [0,0,1],    # 1
   #          [0,0,0]      # 2
   #         ]
  #---------------------------------------------------------------------------
  # graph = [  #0  1  2  3  4  5  6  7  8                  # the ZERO line cuts through the diagonal, and only the top right are evaluated!!!
  #   [0, 1, 0, 0, 0, 0, 0, 0, 0],
  #   [0, 0, 1, 0, 0, 0, 100, 0, 0],
  #   [0, 0, 0, 1, 0, 0, 0, 0, 0],
  #   [0, 0, 0, 0, 1, 0, 0, 0, 0],
  #   [0, 0, 0, 0, 0, 200, 0, 0, 0],
  #   [0, 0, 0, 0, 0, 0, 1, 0, 0],
  #   [0, 0, 0, 0, 0, 0, 0, 1, 0],
  #   [0, 0, 0, 0, 0, 0, 0, 0, 1],
  #   [0, 0, 0, 0, 0, 0, 0, 0, 0]

  # ]

 #---------------------------------------------------------------------------
#  graph = [
#     [999,   999,    1,  999,    999,    999,    999,    999,    999,    ],
#     [999,   999,    999,    1,  999,    999,    999,    999,    1,  ],
#     [1,     999,    999,    999,    1,  999,    999,    999,    999,    ],
#     [999,   1,  999,    999,    999,    999,    999,    999,    999,    ],
#     [999,   999,    1,  999,    999,    999,    1,  999,    999,    ],
#     [999,   999,    999,    999,    999,    999,    999,    999,    999,    ],
#     [999,   999,    999,    999,    1,  999,    999,    999,    1,  ],
#     [999,   999,    999,    999,    999,    999,    999,    999,    999,    ],
#     [999,   1,  999,    999,    999,    999,    1,  999,    999,    ],
# ]
   #-------
    dijkstra(@graph, 0)



    return 0
end
#---------------------------------------------------------------------------
main

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


#---------------------------------------------------------------------------
def distance_from_zero(vertex)
  dist[vertex]
end
#---------------------------------------------------------------------------
def print_shortest_path_from(src)
  queue = []
  pred = src

  while pred != nil do
    queue << pred
    pred = @predecessor[pred]
  end

  queue.each_with_index do |v, i|
      index_of_pred_of_current_vertex = queue[i + 1 % queue.size]
      if index_of_pred_of_current_vertex != nil
        print "#{v} \t -w(#{@graph[v][ index_of_pred_of_current_vertex ]})->\t"
      end

  end
  # print "0"
  # print "#{to_dst}"  # ???
end
#---------------------------------------------------------------------------
puts '-------------------------------------------- path'
print_shortest_path_from 0
puts
# puts '-------------------------------------------- predecessor'
# puts @predecessor
puts '--------------------------------------------'
distance_from_zero(2)
#---------------------------------------------------------------------------


#---------------------------------------------------------------------------
