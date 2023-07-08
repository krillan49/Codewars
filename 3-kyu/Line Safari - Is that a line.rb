#===============================================================================================================
#                                               Description
#===============================================================================================================

# Kata Task
# You are given a grid, which always includes exactly two end-points indicated by X
#
# You simply need to return true/false if you can detect a one and only one "valid" line joining those points.
#
# A line can have the following characters :
#
# - = left / right
# | = up / down
# + = corner
# Rules for valid lines
# The most basic kind of valid line is when the end-points are already adjacent
# X
# X
# XX
# The corner character (+) must be used for all corners (but only for corners).
# If you find yourself at a corner then you must turn.
# It must be possible to follow the line with no ambiguity (lookahead of just one step, and never treading on the same spot twice).
# The line may take any path between the two points.
# Sometimes a line may be valid in one direction but not the other. Such a line is still considered valid.
# Every line "character" found in the grid must be part of the line. If extras are found then the line is not valid.
# Examples
# Good lines
# X---------X
# X
# |
# |
# X
#    +--------+
# X--+        +--+
#                |
#                X
#    +-------------+
#    |             |
# X--+      X------+
#    +-------+
#    |      +++---+
# X--+      +-+   X
# Bad lines
# X-----|----X
# X
# |
# +
# X
#    |--------+
# X---        ---+
#                |
#                X
#    +------
#    |
# X--+      X
#       +------+
#       |      |
# X-----+------+
#       |
#       X
# Hint
# Imagine yourself walking a path where you can only see your very next step. Can you know which step you must take, or not?

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Pathchecker
  def initialize(grid)
    @grid = grid.map(&:chars)
    @grid.each.with_index{|arr, i| arr.each.with_index{|e, j| (@a ? @b = [i, j] : @a = [i, j]) if e == 'X'}} #start/end points
  end

  def data_restart
    @last = nil
    @past = []
  end

  def start
    return false if @grid.flatten.find{|e| ![' ', '+', '|', '-', 'X'].include?(e)}
    data_restart
    return true if pathcheck(1) && !trash_paths?
    data_restart
    return true if pathcheck(2) && !trash_paths?
    false
  end

  def pathcheck(n)
    y, x = n == 1 ? [@a[0], @a[1]] : [@b[0], @b[1]]
    loop do
      @past << [y, x]
      w = possible_directions(y, x, @grid[y][x])
      if @grid[y][x] == '+'
        return false if !(1..2).include?(w.size) or w.count{|wn| wn[0] != @last[0] && wn[1] != @last[1]} != 1
      elsif @grid[y][x] == '-' or @grid[y][x] == '|'
        return false if w == []
      elsif @grid[y][x] == 'X'
        return true if @last
        return false if w.size != 1
      end
      @last = [y, x]
      y, x = w[0]
    end
  end

  private

  def possible_directions(y, x, c) # possible path directions, excluding grid edges, empty cells, previous cell...
    w = [[y + 1, x], [y - 1, x], [y, x + 1], [y, x - 1]]
    .select{|i, j| (0..@grid.size - 1).include?(i) && (0..@grid[0].size - 1).include?(j) && @grid[i][j] != ' '}
    .reject{|e| e == @last or @past.include?(e)}
    if c == '-' or c == '|'
      w.select{|wn| wn[c == '-' ? 0 : 1] == (c == '-' ? y : x) && ['+', c, 'X'].any?{|e| @grid[wn[0]][wn[1]]}}
    else # for '+' && 'X'
      w = w.select do |wy, wx|
        @grid[wy][wx] == '+' or @grid[wy][wx] == 'X' or
        (@grid[wy][wx] == '-' && y == wy) or (@grid[wy][wx] == '|' && x == wx)
      end
      c == 'X' ? w : w.select{|wn| wn[0] != @last[0] && wn[1] != @last[1]}
    end
  end

  def trash_paths?
    @grid.join.tr(' ', '').size != @past.size
  end
end

def line(grid)
  path = Pathchecker.new(grid)
  path.start
end
