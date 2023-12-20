#===============================================================================================================
#                                               Description
#===============================================================================================================

# Kata Task
# Connect the dots in order to make a picture!
#
# Notes
# There are 2-26 dots labelled a b c ...
# Make lines to connect the dots a -> b, b -> c, etc
# The line char is *
# Use only straight lines - vertical, horizontal, or diagonals of a square
# The paper is rectangular - \n terminates every line
# All input is valid
# Examples
# Input	Expected
#
#  a       b
#
#
#  d       c
#
#
#  *********
#          *
#          *
#  *********
#
# Input	Expected
#
#     a
#    e
#
#  d     b
#
#
#     c
#
#
#     *
#    * *
#   *   *
#  *     *
#   *   *
#    * *
#     *

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def connect_the_dots(paper)
  arr = paper.split("\n").map{|s| s.chars}
  dots = []
  arr.each_with_index{|a, i| a.each_with_index{|e, j| dots << [e, i, j] if e != ' '} }
  dots.sort_by(&:first).map{|e, x, y| [x, y]}.each_cons(2).to_a.each do |(x1, y1), (x2, y2)|
    dx, dy = x2-x1, y2-y1
    n = [dx.abs,dy.abs].max
    ex, ey = dx/n, dy/n
    x, y = x1, y1
    (n+1).times do
      arr[x][y] = '*'
      x += ex
      y += ey
    end
  end
  arr.map(&:join).join("\n") + "\n"
end
