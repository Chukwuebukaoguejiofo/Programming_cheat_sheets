# http://rubular.com/

def check(str, regex)
  if ( str =~ regex )
    puts true
    return true
  else
    puts false
    return false
  end
end

# (.*) # enclosed statement
# /[a-z]/ # ranges
# /(foo){10}/ # repetition
# /(foo)*/ # zero or more
# /(foo)+/ # one or more
# /(foo)?/ # optional

check "xxxbrianxxx", /brian/
check "foo", /foo(.*)/
check "foo", /^foo/ # starts with foo
check "foo", /foo$/ # ends with foo
check "foo", /./ # match any character (except new line)
check "\n", /[^.]/ # match any non character
check "bar", /foo|bar/ # foo or bar
check "ship", /ship(ment)?/ # p is optional
check "foobarbar", /foo(bar){2}/ # repeat
check "foobarbarbar", /foo(bar){2,5}/ # range of repetition, between 2 and 5
check "foobarbarbar", /foo(bar){2,}/ # range of repetition, 2 or more
check "foo", /\bfoo\b/ # foo, but not foobar
check "foo", /[^\d]/ # Not a digit
check "foo", /(foo)?/ # optional foo
check "foofoo", /(foo)*/ # zero or more of foo
check "foofoo", /(foo)+/ # one or more of foo
check "foo", /[a-zA-Z]/ # range of characters
check "123", /[^a-zA-Z]/ # range of excluded characters 
check "999-555-1212", /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/ 
check "foo", /\Afoo\Z/ # start and end of string 



#=======





x = "some string"

x =~ /./ # boolean


/./ # any character, except new line


/mike|joe(\sSmith|\sDoe)/ # either nike or joe, and either Smith or Doe after

/^abc$/m # multi-line

/ship?/ # p is optional

/pirate\s(ship)?/ # ship is optional

/abc{2}/ repeat?

/abc{2, 10}/ range of repetition ?


/\bok\b/ # ok, but not okiedokie

/[^\d]/ # Not a digit


#------- number of characters
/x?/
/x*/
/x+/
/foo(enclose something here)bar/



#------- types of characters


/./ # letter
/\letter/  # letter






#------- start and end of line or string


#------- range of characters (or except)

/[a-z]/

/[a-zA-Z]/

/[^abc]/

/[abc]/
