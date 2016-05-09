#!/bin/bash

# to make this file executable, in the terminal do:
# $ chmod +x my_script_test.sh
#
# executing the script:
# $ ./my_script_test.sh
#


# this is a comment!

#----------------------------------------------------------- string
echo this is a string!, no quotes needed


#----------------------------------------------------------- variables
name="brian" # there can be no space close to the 'equals' sign
echo ${name} # you need to use the dollar sign with the variable to use it

# variable syntax:
# first character: lowercase or uppercase character, or a underscore
# the rest of the characters: lowercase or uppercase character, or a underscore, or a number
# valid variables:
# foo Foo _foo Foo # you get the idea!

#----------------------------------------------------------- variable interpolation
name="erich"
echo "hello ${name}"


#----------------------------------------------------------- if statement
if [ "foo" = "bar" ]; then  # not a double equals
    echo "they are equal"
else
    echo "they are not equal"
fi

#----------------------------------------------------------- functions
my_function(){
    first_name=$1 # first parameter
    last_name=$2 # second parameter
    echo "hello Mr. ${last_name}, or would you prefer to be called ${first_name}?"
}

# call the function with a parameter:
my_function brian spinos


#----------------------------------------------------------- loop

# # multiple lines
# for foo in $(ls); do
#     echo $foo
#     echo "------------------"
# done

# # one liner:
# for x in 1 2 3 4 5; do echo $x; done

#----------------------------------------------------------- arrays, and dictionaries
# http://www.thegeekstuff.com/2010/06/bash-array-tutorial/

my_array=(brian ana erich sandra rick)
echo '---------------------------------'
echo ${my_array[@]} # returns all elements of array
echo ${my_array[1]} # ana
echo ${#my_array[@]} # returns the number of elements
echo
echo ${#my_array[1]} # returns the number of characters in elements of index 1
echo ${my_array[@]:3:2} # returns 2 elements starting with element of index 3
echo ${my_array[3]:0:5} # returns a range of characters of the 3rd element,  'sandr'
echo ${my_array[batman]} # brian   # if index does not exist, it will return the first element

# dictionary
echo '---------------------------------'
my_array[foo]=bar
echo "${my_array[foo]}" # bar


# declare an array:
declare -a list_of_names2=('Debian2' 'Red hat2' 'Red hat2' 'Suse2' 'Fedora2');

#-----------------------------------------------------------
