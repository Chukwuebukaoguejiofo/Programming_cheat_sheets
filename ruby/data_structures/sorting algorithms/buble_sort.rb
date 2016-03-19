# Im not sure if its correct


def bubble_sort(array, n)
    (k = 1)..(n - 1).each do |k|
        flag = 0
        (i = 0)..(n - k - 1).each do |i|
            if array[i] > array[i + 1]
                swap( array[i], array[i + 1] )
            end
            flag = 1
        end

        break if flag == 0
    end

end