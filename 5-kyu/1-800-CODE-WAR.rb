#===============================================================================================================
#                                               Description
#===============================================================================================================

# If your phone buttons have letters, then it is easy remember long phone numbers by making words from the substituted digits.
#
# https://en.wikipedia.org/wiki/Phoneword
#
# https://imgur.com/VJU55cg

# This is common for 1-800 numbers
#
# 1-800 number format
# This format probably varies for different countries, but for the purpose of this Kata here are my rules:
#
# A 1-800 number is an 11 digit phone number which starts with a 1-800 prefix.
#
# The remaining 7 digits can be written as a combination of 3 or 4 letter words. e.g.
#
# 1-800-CODE-WAR
# 1-800-NEW-KATA
# 1-800-GOOD-JOB
# The - are included just to improve the readability.
#
# Story
# A local company has decided they want to reserve a 1-800 number to help with advertising.
#
# They have already chosen what words they want to use, but they are worried that maybe that same phone number could spell out other words as well. Maybe bad words. Maybe embarrassing words.
#
# They need somebody to check for them so they can avoid any accidental PR scandals!
#
# That's where you come in...
#
# Kata Task
# There is a preloaded array of lots of 3 and 4 letter (upper-case) words:
#
# For Python it is: WORDS
# Given the 1-800 (phone word) number that the company wants to use, you need to check against all known words and return the set of all possible 1-800 numbers which can be formed using those same digits.
#
# Notes
# The desired phone-word number provided by the company is formatted properly. No need to check.
# All the letters are upper-case. No need to check.
# Only words in the list are allowed.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'set'

W3 = WORDS.select{|w| w.size == 3}.group_by{|w| w[0]}
W4 = WORDS.select{|w| w.size == 4}.group_by{|w| w[0]}
CH = {
  "A"=>2, "B"=>2, "C"=>2, "D"=>3, "E"=>3, "F"=>3, "G"=>4, "H"=>4, "I"=>4, "J"=>5, "K"=>5, "L"=>5, "M"=>6,
  "N"=>6, "O"=>6, "P"=>7, "Q"=>7, "R"=>7, "S"=>7, "T"=>8, "U"=>8, "V"=>8, "W"=>9, "X"=>9, "Y"=>9, "Z"=>9
}
PH = {2=>%w[A B C], 3=>%w[D E F], 4=>%w[G H I], 5=>%w[J K L], 6=>%w[M N O], 7=>%w[P Q R S], 8=>%w[T U V], 9=>%w[W X Y Z]}

def check1800(s)
  arr = s.split('-')[2..3].join.chars.map{|e| PH[CH[e]]}
  arr = arr[0].product(*arr[1..-1]).map(&:join)
  arr1 = arr.select{|s| W4[s[0]].include?(s[0..3]) && W3[s[4]].include?(s[4..6])}.map{|s| [s[0..3], s[4..6]]}
  arr2 = arr.select{|s| W3[s[0]].include?(s[0..2]) && W4[s[3]].include?(s[3..6])}.map{|s| [s[0..2], s[3..6]]}
  (arr1 + arr2).map{|a| '1-800-' + a.join('-')}.to_set
end
