#===============================================================================================================
#                                               Description
#===============================================================================================================

# This kata is a slightly harder version of Gravity Flip. It is recommended to do that first.
#
# Bob is bored in his physics lessons yet again, and this time, he's brought a more complex gravity-changing box with him. It's 3D, with small cubes arranged in a matrix of n×m columns. It can change gravity to go in a certain direction, which can be 'L', 'R', 'D', and 'U' (left, right, down, and up).
#
# Given the initial configuration of the cubes inside of the box as a 2D array, determine how the cubes are arranged after Bob switches the gravity.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def flip(dir, box)
  if dir == 'R'
    box.map(&:sort)
  elsif dir == 'L'
    box.map{|a| a.sort.reverse}
  elsif dir == 'U'
    box.transpose.map{|a| a.sort.reverse}.transpose
  elsif dir == 'D'
    box.transpose.map(&:sort).transpose
  end
end
