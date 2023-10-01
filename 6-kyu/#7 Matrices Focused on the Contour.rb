#===============================================================================================================
#                                               Description
#===============================================================================================================

# See the "contour" of a matrix in the following example:
#
# M = [[ 1, 3, -4,  5, -2,  5,   1],
#     [2,  0, -7,  6,  8,  8,  15],
#     [4,  4, -2,-10,  7, -1,   7],
#     [-1, 3,  1,  0, 11,  4,  21],
#     [-7, 6, -4, 10,  5,  7,   6],
#     [-5, 4,  3, -5,  7,  8,  17],
#     [-11,3,  4, -8,  6, 16,   4]]
# It's made of:
#
# the elements of the first row: 1,3,-4,5,-2,5,1
# the ones of the last column (excepting the first one, 1): 15, 7,21,6,17,4
# the elements of the last row (excepting the last one, 4):16,6,-8,4,3,-11
# and finally, the ones of the first column(excepting the first one, 1, and the last one, -11): -5,-7,-1,4,2
# The instructions for this kata are as it follows:
#
# Input: We receive a matrix, M, of m rows and n columns with two integers a, and b, such that a < b always.
#
# Task: We have to select the elements of the countour of the matrix M that are in the range [a, b] (values of a and b are inclusive) in order to find the element or elements of them with the highest occurrence frequency.
#
# Output: We have to give an array with the maximum amount of occurrences followed by the wanted value or in the case of having two or more encountered values, in increasing order.
#
# See the case with matrix M given above with a = -1 and b = 7.
#
# The contour of M is:
#
# [1,3,-4,5,-2,5,1,15,7,21,6,17,4,16,6,-8,4,3,-11,-5,-7,-1,4,2]
# The elements that are in the range [-1, 7] are:
#
# [1,3,5,5,1,7,6,4,6,4,3,-1,4,2]
# The number 4 has the highest occurrence frequency and it is 3.
#
# So the output will be [3, [4]].
#
# See this another example with the same values for a and b:
#
# M1 = [[ 1,   3, -4,   5,  1,  5,  1],
#     [  2,   0, -7,   6,  8,  8, 15],
#     [  4,   4, -2, -10,  7, -1,  7]
#     [ -1,   3,  1,   0, 11,  4, 21],
#     [ 7,   6, -4,  10,  5,  7,  6],
#     [ 5,   4,  3,  -5,   7,  8, 17],
#     [-11,   3,  4,  -8,  7, 16,  4]]
# The output will be:
#
# [3, [1, 4, 5, 7]]  // see the array of encountered numbers sorted
# That means that the numbers 1, 4, 5, 7 have the same occurrence frequency, 3.
#
# In the case that all the values have the same frequency, the output will be the empty array.
#
# M2 = [[2,1,1,6],
#       [1,3,2,2],
#       [2,1,2,6]]   and a = 0, b = 5
# contour = [2,1,1,6,2,6,2,1,2,1]
#
# Then, [2,1,1,2,2,1,2,1] are in the range [0,5]
#
# 2 with 4 occurrences and 1 with 4 occurrences There is no maximum frequency value so the output will be [].
#
# Features of the Random Tests
#
# Number of tests = 200
# 10 <= m <= 200 // m is the number of rows
# 10 <= n <= 200 // n is the amount of columns
# -50 <= a < b <= 50
# -50 <= m[i][j] <= 50
# Try to avoid using nested loops (unless a very smart one). Probably a O(n²) algorithm will not pass the tests. This kata is tagged with OPTIMIZATION. :)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def countour_mode(m, a, b)
  mt = m.transpose
  p = m[0] + m[-1] + mt[0][1..-2] + mt[-1][1..-2]
  x = p.select{|e| (a..b).include?(e)}
  y = x.uniq.map{|e| [x.count(e),[e]]}
  max = y.max_by{|a| a[0]}[0]
  nums = y.select{|a| a[0] == max}.map{|a| a[1]}.flatten.sort
  x.uniq.sort == nums ? [] : [max, nums]
end
