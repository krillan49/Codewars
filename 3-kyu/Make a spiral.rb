#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your task, is to create a NxN spiral with a given size.
#
# For example, spiral with size 5 should look like this:
#
# 00000
# ....0
# 000.0
# 0...0
# 00000
#
# and with the size 10:
#
# 0000000000
# .........0
# 00000000.0
# 0......0.0
# 0.0000.0.0
# 0.0..0.0.0
# 0.0....0.0
# 0.000000.0
# 0........0
# 0000000000
#
# Return value should contain array of arrays, of 0 and 1, with the first row being composed of 1s. For example for given size 5 result should be:
#
# [[1,1,1,1,1],[0,0,0,0,1],[1,1,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
# Because of the edge-cases for tiny spirals, the size will be at least 5.
#
# General rule-of-a-thumb is, that the snake made with '1' cannot touch to itself.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. The intuitive way to fill in the values in the grid by index works.

# 2. Look at the example and think about the patterns of long filled lines. Although a simple cell-by-cell filling also works.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def spiralize(size)
  field = Array.new(size){Array.new(size, 0)}
  field[0][0] = 1
  x, y = 0, 0
  rdlu, i = %w[r d l u], 0

  pattern = [size-1] + (2..size-1).step(2).to_a.reverse.map{|e| [e, e]}.flatten if size.odd?
  pattern = [size-1] + (3..size-1).step(2).to_a.reverse.map{|e| [e, e]}.flatten + [1] if size.even?

  until pattern.empty?
    n = pattern.shift
    if rdlu[i] == 'r'
      (x+1..x+n).each{|k| field[y][k] = 1}
      x += n
    elsif rdlu[i] == 'd'
      (y+1..y+n).each{|k| field[k][x] = 1}
      y += n
    elsif rdlu[i] == 'l'
      (x-n..x-1).each{|k| field[y][k] = 1}
      x -= n
    elsif rdlu[i] == 'u'
      (y-n..y-1).each{|k| field[k][x] = 1}
      y -= n
    end
    i == 3 ? i = 0 : i += 1
  end

  field
end
