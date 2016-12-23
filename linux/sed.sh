# sed is a stream editor
# the string parameter is a series of multiple commands to operate on each line

# lets say we have these files:
# brian.txt
# erich.txt



$ ls | sed 's/brian/BRIAN/'  
# substitution output # it does not delete anything, 
# just generates output

# OUTPUT
# BRIAN.txt
# erich.txt
