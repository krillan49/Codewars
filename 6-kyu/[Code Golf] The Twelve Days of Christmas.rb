#===============================================================================================================
#                                               Description
#===============================================================================================================

# Challenge taken from the code.golf site
#
# Return the lyrics of the song The Twelve Days of Christmas:
#
# On the First day of Christmas
# My true love sent to me
# A partridge in a pear tree.
#
# On the Second day of Christmas
# My true love sent to me
# Two turtle doves, and
# A partridge in a pear tree.
#
# ...
#
# On the Twelfth day of Christmas
# My true love sent to me
# Twelve drummers drumming,
# Eleven pipers piping,
# Ten lords a-leaping,
# Nine ladies dancing,
# Eight maids a-milking,
# Seven swans a-swimming,
# Six geese a-laying,
# Five gold rings,
# Four calling birds,
# Three French hens,
# Two turtle doves, and
# A partridge in a pear tree.
# Your code can be maximum 500 characters bytes long. Oh, and no imports, please!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def f
m=''
a=[]
{First:"A partridge in a pear tree.",Second:"Two turtle doves, and",Third:"Three French hens,",Fourth:"Four calling birds,",Fifth:"Five gold rings,",Sixth:"Six geese a-laying,",Seventh:"Seven swans a-swimming,",Eighth:"Eight maids a-milking,",Ninth:"Nine ladies dancing,",Tenth:"Ten lords a-leaping,",Eleventh:"Eleven pipers piping,",Twelfth:"Twelve drummers drumming,"}.each{|k,v|
m=v+"\n"+m
a<<"On the #{k} day of Christmas\nMy true love sent to me\n"<<m<<"\n"}
a.join.strip
end
