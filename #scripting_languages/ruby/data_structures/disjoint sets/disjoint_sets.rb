class DisjointSet
    def initialize(size)
        @size = size
        @array = []
        @size.times do |index|
            @array[index] = -1
        end
    end

    def union(x, y)
        xP = find(x)
        yP = find(y)

        if @array[xP] < @array[yP]
            @array[y] = xP
            @array[xP] -= 1
        elsif @array[xP] > @array[yP] 
            @array[x] = yP
            @array[yP] -= 1
        elsif @array[xP] == @array[yP]
            @array[x] = yP
            @array[yP] -= 1
        end   
    end

    def find(x)
        if @array[x] < 0
            return x
        end

        # there was a bug whe I did not use the return on the function call...
        return find(@array[x])
    end

    def print
        @size.times do |index|
            puts "#{index} [#{@array[index]}]"
        end
    end
end


set = DisjointSet.new(10)

set.union(1,2)
set.union(2,3)
set.union(3,4)
set.union(4,5)

set.find(1) # 2
set.find(2) # 2
set.find(3) # 2
set.find(4) # 2
set.find(5) # 2

set.find(6) # 6
set.find(7) # 7
set.find(8) # 8
set.find(9) # 9


set.print
# OUTPUT:
#
# 0 [-1]
# 1 [2]
# 2 [-5]
# 3 [2]
# 4 [2]
# 5 [2]
# 6 [-1]
# 7 [-1]
# 8 [-1]
# 9 [-1]
