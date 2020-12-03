import array

# https://www.programiz.com/python-programming/array

arr = array.array('i', [0] * 5)
arr[1] = 11
arr[2] = 22
arr[3] = 33
arr += array.array('i', [0] * 5)
# arr.extend([0]*5)
arr[9] = 999
print(arr)


li = [1,2,3]
li += [0] * 3
li[5] = 555
print(li)


'''OUTPUT

array('i', [0, 11, 22, 33, 0, 0, 0, 0, 0, 999])
[1, 2, 3, 0, 0, 555]

'''




print("person details {}, {}".format(name, age))


if __name__ == "__main__":
    print("this file is being run from commandline")




#-------------- python 3

x = 123 
y = "abc"
print(f"hello {x} and {y}")
# hello 123 and abc
