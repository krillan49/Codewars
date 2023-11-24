#===============================================================================================================
#                                               Description
#===============================================================================================================

# After becoming famous, CodeBots decided to move to a new building and live together. The building is represented by a rectangular matrix of rooms, each cell containing an integer - the price of the room. Some rooms are free (their cost is 0), but that's probably because they are haunted, so all the bots are afraid of them. That is why any room that is free or is located anywhere below a free room in the same column is not considered suitable for the bots.
#
# Help the bots calculate the total price of all the rooms that are suitable for them.
#
# Example
# For
#
# matrix = [[0, 1, 1, 2],
#             [0, 5, 0, 0],
#             [2, 0, 3, 3]]```
# the output should be `9`.
#
#  Here's the rooms matrix with unsuitable rooms marked with 'x':
# [[x, 1, 1, 2], [x, 5, x, x], [x, x, x, x]]``` Thus, the answer is 1 + 5 + 1 + 2 = 9.
#
# Input/Output
# [input] 2D integer array matrix
#
# 2-dimensional array of integers representing a rectangular matrix of the building.
#
# Constraints:
#
# 1 ≤ matrix.length ≤ 10,
#
# 1 ≤ matrix[0].length ≤ 10,
#
# 0 ≤ matrix[i][j] ≤ 100.
#
# [output] an integer

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def matrix_elements_sum(matrix)
  matrix.transpose.map{|a| a.map.with_index{|n, i| (i != 0 && a[0..i-1].include?(0)) ? 0 : n}}.flatten.sum
end
