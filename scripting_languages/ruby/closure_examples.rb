# Closures: block, proc and lambda (its like a handler function in javascript!)

#------------------------------ blocks with `yield`
def make_sandwich(bread_type)
    meat = 'beef'

    puts bread_type
    yield meat
    puts bread_type
end

make_sandwich('flat bread') do |m| # there can be only 1 block in a function
    puts "#{m} - well done!"
end

#------------------------------ blocks with `&`
def make_sandwich(bread_type, &handler) # there can be only 1 block in a function
    meat = 'beef'

    puts bread_type
    handler.call(meat)
    puts bread_type
end

make_sandwich('flat bread') do |m| # there can be only 1 block in a function
    puts "#{m} - well done!"
end

#------------------------------ proc
def make_sandwich(bread_type, handler)
    meat = 'beef'

    puts bread_type
    handler.call(meat)
    puts bread_type
end

handler = Proc.new do |m|
    puts "#{m} - well done!"
end

make_sandwich('flat bread', handler) 

#------------------------------ lambda
def make_sandwich(bread_type, handler)
    meat = 'beef'

    puts bread_type
    handler.call(meat)
    puts bread_type
end

handler = lambda do |m|
    puts "#{m} - well done!"
end

make_sandwich('flat bread', handler) 

#------------------------------ stabby lambda (Ruby 1.9)
def make_sandwich(bread_type, handler)
    meat = 'beef'

    puts bread_type
    handler.call(meat)
    puts bread_type
end

handler = -> (m){
    puts "#{m} - well done!"
}

make_sandwich('flat bread', handler) 

#------------------------------ differences between proc and lambda:
# 1. they treat the `return` keyword differently:
#        - procs exit the function
#        - lambdas give control back to the function
# 2. lambdas check the number of arguments, procs do not.
