#===============================================================================================================
#                                               Description
#===============================================================================================================

# Jump is a simple one-player game:
#
# You are initially at the first cell of an array of cells containing non-negative integers;
#
# At each step you can jump ahead in the array as far as the integer at the current cell, or any smaller number of cells. You win if there is a path that allows you to jump from one cell to another, eventually jumping past the end of the array, otherwise you lose.
#
# For instance, if the array contains the integers
#
# [2, 0, 3, 5, 0, 0, 3, 0, 0, 3, 1, 0],
#
# you can win by jumping from 2, to 3, to 5, to 3, to 3, then past the end of the array.
#
# You can also directly jump from from the initial cell(first cell) past the end of the array if they are integers to the right of that cell.
#
# E.g
#
# [6, 1, 1] is winnable
#
# [6] is not winnable
#
# Note: You can not jump from the last cell!
#
# [1, 1, 3] is not winnable
#
# -----
# Your task is to complete the function that determines if a given game is winnable.
#
# More Examples
# [5] => false (you can't jump from the last cell)
# [2, 5] => true
# [3, 0, 2, 3] => true (3 to 2 then past end of array)
# [4, 1, 2, 0, 1] => false
# [5, 0, 0, 0] => true
# [1, 1] => false

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def can_jump(arr)
  return false if arr.size < 2
  p = 0
  arr.each.with_index do |n, i|
    p -= 1
    p = n if p < n
    return false if p == 0 || (p == 1 && i == arr.size - 2)
  end
  true
end
