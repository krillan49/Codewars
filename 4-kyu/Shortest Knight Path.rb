#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given two different positions on a chess board, find the least number of moves it would take a knight to get from one to the other. The positions will be passed as two arguments in algebraic notation. For example, knight("a3", "b5") should return 1.
#
# The knight is not allowed to move off the board. The board is 8x8.
#
# For information on knight moves, see https://en.wikipedia.org/wiki/Knight_%28chess%29
#
# For information on algebraic notation, see https://en.wikipedia.org/wiki/Algebraic_notation_%28chess%29
#
# (Warning: many of the tests were generated randomly. If any do not work, the test cases will return the input, output, and expected output; please post them.)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'set'

def knight(start, finish)
  return 0 if start == finish
  start, finish = [start, finish].map{|s| [s.split('')[0].ord-97, s.split('')[1].to_i-1]}
  moves, no, count = Set.new, [[start]], 0
  mvs = [[1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]
  loop do
    arr = []
    no[count].each do |y, x|
      mvs.each do |i, j|
        a = [y+i, x+j]
        return count + 1 if a == finish
        if y+i >= 0 && y+i <= 7 && x+j >=0 && x+j <= 7 && !moves.include?(a)
          arr << a
          moves << a
        end
      end
    end
    no << arr
    count += 1
  end
  [start, finish]
end
