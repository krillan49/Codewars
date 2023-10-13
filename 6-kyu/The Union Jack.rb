#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your aged grandfather is tragically optimistic about Team GB's chances in the upcoming World Cup, and has enlisted you to help him make Union Jack flags to decorate his house with.
#
# Instructions
# Write a function which takes as a parameter a number which represents the dimensions of the flag. The flags will always be square, so the number 9 means you should make a flag measuring 9x9.
# It should return a string of the flag, with 'X' for the red/white lines and '-' for the blue background. It should include newline characters so that it's not all on one line.
# For the sake of symmetry, treat odd and even numbers differently: odd number flags should have a central cross that is only one 'X' thick. Even number flags should have a central cross that is two 'X's thick (see examples below).
# Other points
# The smallest flag you can make without it looking silly is 7x7. If you get a number smaller than 7, simply make the flag 7x7.
# If you get a decimal, round it UP to the next whole number, e.g. 12.45 would mean making a flag that is 13x13.
# If you get something that's not a number at all, return false.
# Translations and comments (and upvotes) welcome!
#
# alt
#
# Examples:
# union_jack(9) # (9 is odd, so the central cross is 1'X' thick)
# "X---X---X
# -X--X--X-
# --X-X-X--
# ---XXX---
# XXXXXXXXX
# ---XXX---
# --X-X-X--
# -X--X--X-
# X---X---X"
#
# union_jack(10) # (10 is even, so the central cross is 2 'X's thick)
# 'X---XX---X
# -X--XX--X-
# --X-XX-X--
# ---XXXX---
# XXXXXXXXXX
# XXXXXXXXXX
# ---XXXX---
# --X-XX-X--
# -X--XX--X-
# X---XX---X
#
# union_jack(1) # (the smallest possible flag is 7x7)
# "X--X--X
# -X-X-X-
# --XXX--
# XXXXXXX
# --XXX--
# -X-X-X-
# X--X--X"
#
# union_jack('string') #return false.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def union_jack(n)
  return false if n.class.superclass != Numeric
  n = n.ceil
  n = 7 if n < 7
  if n.odd?
    x = Array.new(n / 2){Array.new(n, '-')}
    .map.with_index{|a, i| a.map.with_index{|e, j| [i, a.size/2, a.size-1-i].include?(j) ? 'X' : e}}
    k = 1
  else
    x = Array.new(n / 2 - 1){Array.new(n, '-')}
    .map.with_index{|a, i| a.map.with_index{|e, j| [i, a.size/2-1, a.size/2, a.size-1-i].include?(j) ? 'X' : e}}
    k = 2
  end
  (x + [['X'] * n] * k + x.reverse).map(&:join).join("\n")
end
