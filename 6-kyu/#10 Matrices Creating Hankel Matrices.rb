#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Catalan Numbers are defined by the formula:
#
# https://imgur.com/dpDsgz2
#
# The first nine Catalan Numbers are:
#
# Catalan Number    Ordinal Term
# 1                      0
# 1                      1
# 2                      2
# 5                      3
# 14                     4
# 42                     5
# 132                    6
# 429                    7
# 1430                   8
# The Hankel Matrix is filled with the Catalan Numbers repeating the same term along the diagonals that have the direction UP-RIGHT to DOWN-LEFT, and have a courious property, its determinant is equal to 1. The following is a 4 x 4 Hankel matrix, and as we said before, its determinant value equals to 1.
#
# https://imgur.com/8fiCuvt
#
# The task for this kata is to create a code that may build a Hankel Matrix with the distribution of terms given above. For more information about Catalan Numbers and the Hankel Matrix you may check at Wikipedia, Here.
#
# Features of the random Tests:
#
# number of tests = 80
# 2 <= n <= 100  // n, dimension of the matrix

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def hankel_matrix_maker(n)
  Array.new(n){(0..n-1).to_a}.map.with_index do |a, i|
    a.map.with_index{|n, j| i + j == 0 ? 1 : (1..2*(i+j)).inject(:*) / ((1..i+j+1).inject(:*) * (1..i+j).inject(:*)) }
  end
end
