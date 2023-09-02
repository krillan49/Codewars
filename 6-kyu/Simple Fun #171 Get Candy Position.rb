#===============================================================================================================
#                                               Description
#===============================================================================================================

# Mr.Nam has n candies, he wants to put one candy in each cell of a table-box. The table-box has r rows and c columns.
#
# Each candy was labeled by its cell number. The cell numbers are in range from 1 to N and the direction begins from right to left and from bottom to top.
#
# Nam wants to know the position of a specific candy and which box is holding it.
#
# The result should be an array and contain exactly 3 elements. The first element is the label of the table; The second element is the row of the candy; The third element is the column of the candy.
#
# If there is no candy with the given number, return [-1, -1, -1].
#
# Note:
#
# When the current box is filled up, Nam buys another one.
#
# The boxes are labeled from 1.
#
# Rows and columns are 0-based numbered from left to right and from top to bottom.
#
# Example
# For n=6,r=2,c=2,candy=3, the result should be [1,0,1]
#
# the candies will be allocated like this:
#
# Box 1
# +-----+-----+
# |  4  | (3) | --> box 1,row 0, col 1
# +-----+-----+
# |  2  |  1  |
# +-----+-----+
# Box 2
# +-----+-----+
# |  x  |  x  |
# +-----+-----+
# |  6  | (5) | --> box 2,row 1, col 1
# +-----+-----+```
#  For `candy = 5(n,r,c same as above)`, the output should be `[2,1,1]`.
#
#  For `candy = 7(n,r,c same as above)`, the output should be `[-1,-1,-1]`.
#
#  For `n=8,r=4,c=2,candy=3`, the result should be `[1,2,1]`
# Box 1 +-----+-----+ | 8 | 7 | +-----+-----+ | 6 | 5 | +-----+-----+ | 4 | (3) |--> box 1,row 2, col 1 +-----+-----+ | 2 | 1 | +-----+-----+
#
# ```
#
# Input/Output
# [input] integer n
# The number of candies.
#
# 0 < n <= 100
#
# [input] integer r
# The number of rows.
#
# 0 < r <= 100
#
# [input] integer c
# The number of columns.
#
# 0 < c <= 100
#
# [input] integer candy
# The label of the candy Nam wants to get position of.
#
# 0 < c <= 120
#
# [output] an integer array
# Array of 3 elements: a label, a row and a column.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_candy_position(n, r, c, candy)
  return [-1, -1, -1] if candy > n
  pos = candy % (c * r)
  arr = Array.new(r){Array.new(c, 0)}
  arr[(pos.to_f / c).ceil - 1][pos % c - 1] = 1
  res = arr.map(&:reverse).reverse
  box = (candy.to_f / (c * r)).ceil
  row = res.index(res.find{|a| a.include?(1)})
  col = res[row].index(1)
  [box, row, col]
end
