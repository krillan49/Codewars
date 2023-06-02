#===============================================================================================================
#                                               Description
#===============================================================================================================

# create a function that accepts 1 (one) parameter and returns a string that has such a pattern:
#
# parameter: 1, generate pattern:
#
# x```
# parameter: 2, generate pattern:
#
# x
# x x
#   x
# parameter: 3, generate pattern:
#
#  x
#   x
# x o x
#  x
#   x
# parameter: 4, generate pattern:
#
#   x
#    x
#   o x
# x o o x
#  x o
#   x
#    x
# parameter: 5, generate pattern:
#
#    x
#     x
#    o x
#     o x
# x o x o x
#  x o
#   x o
#    x
#     x
# parameter: 6, generate pattern:
#
#     x
#      x
#     o x
#      o x
#     x o x
# x o x x o x
#  x o x
#   x o
#    x o
#     x
#      x
# and so on...
#
# assume that:
# N is an integer within range [-100..200]
#
# the function should return empty string if given parameter lower than 1
#
# additional info
# the result is compared with smart algorithm, so you don't have to worry about additional space characters that's not visible.
#
# for example, this string:
#     x    \n     x   \n    o x  \n     o x \nx o x o x\n x o     \n  x o    \n   x     \n    x    \n
# which is seen as:
#
#     x
#      x
#     o x
#      o x
# x o x o x
#  x o
#   x o
#    x
#     x
# is treated the same as:
#     x\n     x\n    o x\n     o x\nx o x o x\n x o\n  x o\n   x\n    x
# which is seen as:
#
#     x
#      x
#     o x
#      o x
# x o x o x
#  x o
#   x o
#    x
#     x
# because both are visibly the same.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# In the description of the kata there is (at the time I was solving it) a problem with the lines that have moved in the examples (in fact they are symmetrical), this can be confusing, in the description here the examples are corrected

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def pattern_generator(n)
  return '' if n == 0
  return 'x' if n == 1
  pattern = (1..n).to_a + (1..n-1).to_a.reverse
  res = ''
  pattern.each.with_index do |x, i|
    halfline = (1..x/2).map{|e| e.odd? ? 'x' : 'o'}.join(' ')
    center = x.even? ? ' ' : (halfline[-1] == 'x' ? ' o ' : ' x ')
    if i < n - 1
      res += (' '*(n - x + halfline.size) + center + halfline.reverse + "\n")
    elsif i == n - 1
      res += (' '*(n - x) + halfline + center + halfline.reverse + "\n")
    else
      res += (' '*(n - x) + halfline + center + "\n")
    end
  end
  res[-4]=''
  res.rstrip[1..-1]
end
