#===============================================================================================================
#                                               Description
#===============================================================================================================

# This method accepts a single argument, a string to be validated.
#
# The string can be of any length and have any contents. But to be considered valid, it must have zero or more spaces, followed by zero to eight numeric digits, followed by, again, zero or more spaces.
#
# If it is valid, the number within the string + 1 is returned. Otherwise, the string 'invalid' is returned. A completely empty string is considered valid, equal to zero.
#
# '   7   '     returns 8
#
# '   2 8   '     returns 'invalid' (there mustn't be any spaces (or any other characters) between digits
#
# '     a  8 '     returns 'invalid'
#
# '    ' returns 1
#
# 'abc1' returns 'invalid'
#
# An easy problem.
#
# The only slight challenge is to produce a simple method that has no regular expressions and no nesting; no explict nesting with 'for' or 'while' or whatever, no block nesting with things like 'map' or 'each'; obviously I have no way of enforcing this!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def validation str
  return 1 if str.tr(' ', '') == ''
  arr = str.split
  return 'invalid' if arr.size > 1
  str = arr.join
  return 'invalid' if str.size > 8 or str.tr('0-9', '') != ''
  str.to_i + 1
end
