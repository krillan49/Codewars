#===============================================================================================================
#                                               Description
#===============================================================================================================

# Ruby version - based off http://www.codewars.com/kata/nato-phonetic-alphabet
#
# Differences:
#
# An Array instead of a Dictionary is supplied.
# Messages with uppercase and lowercase letters can be in the input.
# Non-alphanumerics can also be in the input and should be omitted from the result string.
# "In this kata, we're going to create the function nato that takes a word and returns a string spells the word using the NATO phonetic alphabet.
#
# There should be a space between each word in the returned string, and the first letter of each word should be capitalized and the rest lowercase."

#===============================================================================================================
#                                               Solution
#===============================================================================================================

ABC = {"A"=>"Alpha", "B"=>"Bravo", "C"=>"Charlie", "D"=>"Delta", "E"=>"Echo", "F"=>"Foxtrot", "G"=>"Golf", "H"=>"Hotel", "I"=>"India", "J"=>"Juliet", "K"=>"Kilo", "L"=>"Lima", "M"=>"Mike", "N"=>"November", "O"=>"Oscar", "P"=>"Papa", "Q"=>"Quebec", "R"=>"Romeo", "S"=>"Sierra", "T"=>"Tango", "U"=>"Uniform", "V"=>"Victor", "W"=>"Whiskey", "X"=>"XRay", "Y"=>"Yankee", "Z"=>"Zulu", "0"=>"Zero", "1"=>"One", "2"=>"Two", "3"=>"Tree", "4"=>"Four", "5"=>"Fife", "6"=>"Six", "7"=>"Seven", "8"=>"Eight", "9"=>"Niner"}

def nato(message)
  message.upcase.tr('^A-Z0-9','').chars.map{|c| ABC[c]}.join(' ')
end
