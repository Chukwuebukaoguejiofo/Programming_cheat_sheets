# a graph connector!

#---------------------------------------------------------------------------
@x = [
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999],
[999,999,999,999,999,999,999,999,999]

]
#---------------------------------------------------------------------------
def connect(array, src, dst, weight) # symetrically
  @x[src][dst] = weight
  @x[dst][src] = weight
end
#---------------------------------------------------------------------------
def display(array)
  print "\t\t"
  array[0].each_with_index do |line, j|
    print "[#{j}]\t\t"
  end
  puts
  array.each_with_index do |line, i|
    print "[#{i}]\t\t"
    line.each do |column|

      print column
      print "\t\t"
    end
    print "\n"
  end
end
#---------------------------------------------------------------------------
def display_array(array)
  print "["
  array[0].each_with_index do |line, j|
    # print "[#{j}]\t\t"
  end
  puts
  array.each_with_index do |line, i|
    print "\t["
    line.each do |column|

      print "#{column}, "
      print "\t"
    end
    print "], \n"
  end
  puts "]"
end

#---------------------------------------------------------------------------
connect(@x, 0,2,1)
connect(@x, 2,4,1)
connect(@x, 4,6,1)
connect(@x, 6,8,1)
connect(@x, 8,1,1)
connect(@x, 1,3,1)
# connect(@x, 0,2,400)

#---------------------------------------------------------------------------
display_array @x



# #---------------------------------------------------------------------------
# def print_path(vertex)
#   queue = []
#   # print "#{vertex} <-"

#   pred = @predecessor[vertex]

#   while @predecessor[pred] != nil do
#     # print " #{pred } <- "
#     queue << pred
#     pred = @predecessor[pred]
#   end

#   queue.reverse.each do |v|
#     print "#{v} -> "
#   end
# end
# #---------------------------------------------------------------------------
# print_path(1)
# puts
# puts "---"
# puts @predecessor
# puts "---"







