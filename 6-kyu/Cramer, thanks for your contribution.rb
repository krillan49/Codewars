#===============================================================================================================
#                                               Description
#===============================================================================================================

# Cramer (1704 -1752), the swiss mathematician that created a method to solve systems of n linear equations with n variables.
#
# We have a linear system of n Equations with n Variables like the following:
#
# https://imgur.com/IK2keV7
#
# The subindexed values a11, a12, .....ann, are the coefficients of the different variables x1, x2, ....., xn.
#
# We define Δ (delta), the determinant of the matrix of the coefficients as it follows:
#
# https://imgur.com/zvVIYVB
#
# You may calculate the determinant also by the way is explained at the kata Matrix Determinant. See at: http://www.codewars.com/kata/matrix-determinant
#
# You may learn also to calculate the determinant: https://en.wikipedia.org/wiki/Determinant
#
# Then, we define the vector, V, with the independent terms b1, b2, ...., bn:
#
# https://imgur.com/m6m20id
#
# We will obtain the determinants for each variable replacing the vector V for a column in the position of the variable. Δx1, the determinant for the variable x1, Δx2, the determinant for the variable x2 and so on. It is as follows:
#
# https://imgur.com/GaEIFJV
#
# So the values of the variables are:
#
# https://imgur.com/GMANk3Y
#
# We should know that a linear equation system may be solvable, unsolvable or indeterminate as the following chart shows below:
#
# If Δ ≠ 0 , the equation system is solvable. Each variable will have a value.
#
# If Δ = 0: the system will be Unsolvable if one of the variables Δxi is not 0 or the system will be Indeterminate or Unsolvable if all the values of Δxi are 0.
#
# For that purpose we need a function cramer_solver(), that will accept two arguments, matrix and vector.
#
# The function will output the array with the following results and order:
#
# [Δ, Δx1, Δx2,........,Δxn]
# But if Δ = 0 and all the Δxi are 0, the code will output "Indeterminate or Unsolvable". If Δ = 0 and at least only one Δxi ≠ 0, the code will output "Unsolvable".
#
# If matrix is not square (equal amount of rows and columns) or the lengths of matrix and vector V are different, the code will "Check entries".
#
# Let's see how to solve some example using maths and how the results would be.
#
# We want to solve the following system of equations:
#
# 4x - 6y - 3z = 12
#  x +  y - 2z = 3
# 4x -20y - 4z = 6
# So the function will receive the following matrix and vector:
#
# matrix =[[4,-6, -3], [ 1 , 1, -2], [4, -20, -4]]
# vector = [12, 3, 6]
# cramer_solver(matrix, vector) == [-80, -330, -30, -60]
# Another case:
#
# x + y - 3z = -10
# x + y - 2z = 3
# x + y - 4z = -6
# So our solver will receive our matrix and vector:
#
# matrix = [[1, 1, -3], [1, 1, -2], [1, 1, -4]]
# vector = [-10, 3, -6]
# cramer_solver(matrix, vector) == "Unsolvable"
# Let's see another more:
#
# x + y - 3z = 0
# x + y - 2z = 0
# x + y - 4z = 0
# The matrix and vector for this case:
#
# matrix = [[1, 1, -3], [1, 1, -2], [1, 1, -4]]
# vector = [0, 0, 0]
# cramer_solver(matrix, vector) == "Indeterminate or Unsolvable"
# If we introduce a matrix that is not square, the function should detect it.
#
# matrix = [[1, 1, -3, 4], [1, 1, -2, 3], [1, 1, -4, 2]]
# vector = [0, 0, 0]
# cramer_solver(matrix, vector) == "Check entries"
# Also cases where one (or more) row(s) has (have) different lengths.
#
# matrix = [[1, 1, -3], [1, 1], [1, 1, -4]]
# vector = [-10, 3, -6]
# cramer_solver(matrix, vector) == "Check entries"
# The cases when the dimension of matrix is different than the length of vector should be detected, too.
#
# matrix = [[1, 1, -3, 4], [1, 1, -2, 3], [1, 1, -4, 2], [6, 4, 2, 1]]
# vector = [1, 1, 1]
# cramer_solver(matrix, vector) == "Check entries"
# The coefficients of the equation will be integer values for all the cases, so the array output should have only integers
#
# The tests will challenge your code for linear equations systems up to 8 variables (and 8 equations obviously)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'matrix'

def cramer_solver(matrix, vector)
  return 'Check entries' if matrix.map(&:size).uniq.size != 1 or matrix[0].size != matrix.size or matrix[0].size != vector.size
  del = Matrix[*matrix].det
  res = (0...matrix.size).each_with_object([]) do |n, arr|
    arr << Matrix[ *matrix.map.with_index{|a, i| a.map.with_index{|e, j| j == n ? vector[i] : e}} ].det
  end
  if del == 0
    return res.all?(&:zero?) ? 'Indeterminate or Unsolvable' : 'Unsolvable'
  end
  [del] + res
end
