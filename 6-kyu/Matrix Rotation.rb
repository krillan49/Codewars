#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a matrix represented as a list of string, such as
#
# ###.....
# ..###...
# ....###.
# .....###
# .....###
# ....###.
# ..###...
# ###.....
# write a function
#
# rotate_clockwise(matrix)
#
# that return its 90° clockwise rotation, for our example:
#
# #......#
# #......#
# ##....##
# .#....#.
# .##..##.
# ..####..
# ..####..
# ...##...
#  /!\ You must return a rotated copy of matrix! (matrix must be the same before and after calling your function)
# Note that the matrix isn't necessarily a square, though it's always a rectangle!
# Please also note that the equality m == rotateClockwise(rotateClockwise(rotateClockwise(rotateClockwise(m)))); (360° clockwise rotation), is not always true because rotateClockwise(['']) => [] and rotateClockwise(['','','']) => [] (empty lines information is lost)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def rotate_clockwise matrix
  matrix.map(&:chars).transpose.map(&:reverse).map(&:join)
end
