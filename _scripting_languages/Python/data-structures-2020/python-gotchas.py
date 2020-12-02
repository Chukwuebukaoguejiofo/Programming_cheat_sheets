import array
arr = array.array('i', [0] * 10)
arr[1] = 11
arr[2] = 22
arr[3] = 33
print(arr)
# array('i', [0, 11, 22, 33, 0, 0, 0, 0, 0, 0])
