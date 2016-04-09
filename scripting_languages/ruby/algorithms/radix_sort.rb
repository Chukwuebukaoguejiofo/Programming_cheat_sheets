def radixSort(array)
    temp = []

    array.each do |x|
        if temp[x] == nil
            temp[x] = 1
        else
            temp[x] = temp[x] + 1
        end
    end

    temp.each_with_index do |x, i|
        if (x)
            x.times do
                puts i
            end
        end
    end
end

array = [5,4,6,3,7,2,8,1,9,0]
radixSort(array)

p array