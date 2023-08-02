#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this finite version of Conway's Game of Life (here is an excerpt of the rules) ...
#
# The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:
#
# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
# The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one)
# ...implement your own method which will take the initial state as an NxM array of 0's (dead cell) and 1's (living cell) and return an equally sized array representing the next generation. Cells outside the array must be considered dead. Cells that would born out of the array boundaries should be ignored (universe never grows beyond the initial NxM grid).
# N.B.: for illustration purposes, 0 and 1 will be represented as ░ and ▓ blocks (PHP: basic black and white squares) respectively. You can take advantage of the 'htmlize' function to get a text representation of the universe:
# eg:
# puts htmlize(cells)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def next_gen(c)
  res = Array.new(c.size){Array.new(c[0].size, 0)}
  c.each.with_index do |a, i|
    a.each.with_index do |n, j|
      area = []
      area << (i != 0 ? c[i-1][j] : 0)
      area << (i != c.size-1 ? c[i+1][j] : 0)
      area << (j != 0 ? c[i][j-1] : 0)
      area << (j != a.size-1 ? c[i][j+1] : 0)
      area << (i != 0 && j != 0 ? c[i-1][j-1] : 0)
      area << (i != c.size-1 && j != a.size-1 ? c[i+1][j+1] : 0)
      area << (i != 0 && j != a.size-1 ? c[i-1][j+1] : 0)
      area << (i != c.size-1 && j != 0 ? c[i+1][j-1] : 0)
      count = area.count(1)
      res[i][j] = n == 1 && (count < 2 or count > 3) ? 0 : (n == 1 && [2, 3].include?(count)) || (n == 0 && count == 3) ? 1 : n
    end
  end
  res
end
