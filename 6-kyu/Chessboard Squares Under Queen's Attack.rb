#===============================================================================================================
#                                               Description
#===============================================================================================================

# For a given pair of a and b : Consider a Chess board of a × b squares. Now, for each of the squares; Imagine a Queen standing on that square and compute the number of squares under the queen's attack. Add all the numbers you get for each of the a × b possible queen's position and return it.
#
# Examples :
#
# For a = 2 and b = 2 : squaresUnderQueenAttack(2,2) => 12.
# For a = 2 and b = 3 : squaresUnderQueenAttack(2,3) => 26.
#
# Explaination :
#
# https://i.imgur.com/QMgd2Pf.png
#
# Constraints :
#
# 1 ≤ a ≤ 20.
# 1 ≤ b ≤ 20.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def chessboard_squares_under_queen_attack a,b
  lines, diags = a * b * (a + b - 2), 0
  arr = Array.new(a){Array.new(b, nil)}
  arr.each_with_index do |ar, i|
    ar.each_with_index do |e, j|
      diags += ([j,i].min + [i,ar.size-1-j].min + [ar.size-1-j, arr.size-1-i].min + [arr.size-1-i, j].min)
    end
  end
  lines + diags
end
