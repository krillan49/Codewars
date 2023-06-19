#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a Sudoku data structure with size NxN, N > 0 and √N == integer, write a method to validate if it has been filled out correctly.
#
# The data structure is a multi-dimensional Array, i.e:
#
# [
#   [7,8,4,  1,5,9,  3,2,6],
#   [5,3,9,  6,7,2,  8,4,1],
#   [6,1,2,  4,3,8,  7,5,9],
#
#   [9,2,8,  7,1,5,  4,6,3],
#   [3,5,7,  8,4,6,  1,9,2],
#   [4,6,1,  9,2,3,  5,8,7],
#
#   [8,7,6,  3,9,4,  2,1,5],
#   [2,4,3,  5,6,1,  9,7,8],
#   [1,9,5,  2,8,7,  6,3,4]
# ]
# Rules for validation
#
# Data structure dimension: NxN where N > 0 and √N == integer
# Rows may only contain integers: 1..N (N included)
# Columns may only contain integers: 1..N (N included)
# 'Little squares' (3x3 in example above) may also only contain integers: 1..N (N included)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Sudoku
  def initialize(data)
    @board = data
  end

  def valid?
    return false if @board.size**0.5 % 1 != 0 or @board.any?{|line| line.size != @board.size}
    return false if @board.flatten.any?{|n| n.class != Integer or !(1..@board.size).include?(n)}
    return false if @board.any?{|a| a.uniq != a} or @board.transpose.any?{|a| a.uniq != a}
    n = (@board.size**0.5).to_i
    @board.each_slice(n).to_a.each do |t|
      n.times do |x|
        return false if t.map{|a| a.select.with_index{|e,i| (x*n..x*n+(n-1)).include?(i)}}.flatten.sort != (1..n**2).to_a
      end
    end
    true
  end
end
