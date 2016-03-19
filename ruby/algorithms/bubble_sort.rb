
def bubblesort1(array)
    array.length.times do |j|
        for i in 1...(array.length - j)
            if array[i] < array[i - 1]
                array[i], array[i - 1] = array[i - 1], array[i]
            end
        end
    end
    array
end
 def bubblesort2(array)
    each_index do |index|
        (array.length - 1).downto( index ) do |i|
            array[i-1], array[i] = array[i], array[i-1] if array[i-1] < array[i]
        end
    end
    array
end

array = [5,4,6,3,7,2,8,1,9,0]
bubblesort1(array)
p array
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]