import array
arr = array.array('i', [0] * 5)
arr[1] = 11
arr[2] = 22
arr[3] = 33
arr.insert(4,44)

arr += array.array('i', [0] * 5)
print(arr)
# array('i', [0, 11, 22, 33, 44, 0, 0, 0, 0, 0, 0])
