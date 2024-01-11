#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a program that will take a string of digits and give you all the possible consecutive slices of length n in that string.
#
# Raise an error if n is larger than the length of the string.
#
# Examples
# For example, the string "01234" has the following 2-digit slices:
#
# [0, 1], [1, 2], [2, 3], [3, 4]
# The same string has the following 4-digit slices:
#
# [0, 1, 2, 3], [1, 2, 3, 4]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def series_slices(digits, n)
  raise if n > digits.size
  digits.chars.map(&:to_i).each_cons(n).to_a
end
