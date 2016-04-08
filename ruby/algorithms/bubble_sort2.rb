# working

# you start in the second element of the array, walk the array, and keep swapping with the previous element.
#     doing that N times, N being the number of elements in the array
#     every loop the last index is closer to index 1 (the last index is subtracted by 1)

def bubbleSort(array)
    array.each_with_index do |e, j| # all indexes  # 0 1 2 3 4 5 6 7
        puts "---------------------- ONE: #{j}"
        1.upto( (array.length - j) - 1) do |i|  # indexes: 1 upto the last index (the first time), and each loop, the last index decreases.
            puts "TWO: #{i}"
            if array[i] < array[i - 1] # if element is less then its previous (thats why we start with the second element)
                # swap in ruby ->    ( a,b = b, a )
                array[i], array[i - 1] = array[i - 1], array[i] 
            end
        end
    end
    return array
end
array = [5,4,6,3,7,2,8,1,9,0]
bubbleSort(array)  # bubbleSort((1..5000).to_a) # 6 seconds
p array # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


=begin if your array has 10 elements

---------------------- ONE: 0
TWO: 1
TWO: 2
TWO: 3
TWO: 4
TWO: 5
TWO: 6
TWO: 7
TWO: 8
TWO: 9
---------------------- ONE: 1
TWO: 1
TWO: 2
TWO: 3
TWO: 4
TWO: 5
TWO: 6
TWO: 7
TWO: 8
---------------------- ONE: 2
TWO: 1
TWO: 2
TWO: 3
TWO: 4
TWO: 5
TWO: 6
TWO: 7
---------------------- ONE: 3
TWO: 1
TWO: 2
TWO: 3
TWO: 4
TWO: 5
TWO: 6
---------------------- ONE: 4
TWO: 1
TWO: 2
TWO: 3
TWO: 4
TWO: 5
---------------------- ONE: 5
TWO: 1
TWO: 2
TWO: 3
TWO: 4
---------------------- ONE: 6
TWO: 1
TWO: 2
TWO: 3
---------------------- ONE: 7
TWO: 1
TWO: 2
---------------------- ONE: 8
TWO: 1
---------------------- ONE: 9

=end
