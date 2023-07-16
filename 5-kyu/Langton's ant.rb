#===============================================================================================================
#                                               Description
#===============================================================================================================

# Langton's ant is a two-dimensional Turing machine invented in the late 1980s. The ant starts out on a grid of black and white cells and follows a simple set of rules that has complex emergent behavior.
#
# Task
# Complete the function and return the nth iteration of Langton's ant with the given input.
#
# Parameters:
# grid - a two dimensional array of 1s and 0s (representing white and black cells respectively)
# column - horizontal position of ant
# row - ant's vertical position
# n - number of iterations
# dir - ant's current direction (0 - north, 1 - east, 2 - south, 3 - west), should default to 0
# Note: parameters column and row will always be inside the grid, and number of generations n will never be negative.
#
# Output
# The state of the grid after n iterations.
#
# Rules
# The ant can travel in any of the four cardinal directions at each step it takes. The ant moves according to the rules below:
#
# At a white square (represented with 1), turn 90° right, flip the color of the square, and move forward one unit.
# At a black square (0), turn 90° left, flip the color of the square, and move forward one unit.
# The grid has no limits and therefore if the ant moves outside the borders, the grid should be expanded with 0s, respectively maintaining the rectangle shape.
#
# Example
# ant([[1]], 0, 0, 1, 0)   # should return: [[0, 0]]
# Initially facing north (0), at the first iteration the ant turns right (because it stands on a white square, 1), flips the square and moves forward.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def ant(grid, xi, yi, n, dir = 0) # %w[u r d l]
  field = Array.new(20){Array.new(20, '0')}
  grid.each.with_index{|a, i| a.each.with_index{|e, j| field[field.size/2+i][field.size/2+j] = e}}

  y = field.size / 2 + yi
  x = field.size / 2 + xi

  n.times do
    dir = field[y][x] == 1 ? (dir > 2 ? 0 : dir + 1) : (dir < 1 ? 3 : dir - 1)
    field[y][x] = (field[y][x].to_i - 1).abs
    dir == 0 ? y -= 1 : dir == 1 ? x += 1 : dir == 2 ? y += 1 : x -= 1
  end
  field[y][x] = field[y][x].to_i

  my, mx = [], []
  field.each.with_index do |a, i|
    my << i if a.include?(0) or a.include?(1)
    a.each.with_index{|e, j| mx << j if e==1 or e==0}
  end
  bor = [my.minmax, mx.minmax]
  field.map.with_index do |a, i|
    i.between?(*bor[0]) ? a.map.with_index{|e, j| j.between?(*bor[1]) ? e : nil}.compact : nil
  end.compact.map{|a| a.map(&:to_i)}
end
