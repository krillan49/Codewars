#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a square matrix, rotate the original matrix 90 degrees clockwise... in place! This means that you are not allowed to build a rotated matrix and return it. Modify the original matrix using a temporary variable to swap elements and return it. You are allowed to use a couple scalar variables if needed.
#
# Solutions similar to the following are correct, but not allowed for this kata:
#
# def rotate_not_in_place(matrix):
#   return [[row[i] for row in reversed(matrix)] for i in range(len(matrix))]
# Esentially any method that involves generating a new matrix isn't allowed.
#
# To sum up, given a square matrix of any size as an input:
#
#   [[1, 2, 3],
#   [4, 5, 6],
#   [7, 8, 9]]
# Modify the original matrix rotating it in place 90 degrees clockwise and return it:
#
#   [[7, 4, 1],
#   [8, 5, 2],
#   [9, 6, 3]]
# This problem is very googleable so I suggest trying it out without looking for help.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def transpose!
    replace(transpose)
  end
end

def rotate_in_place(matrix)
  matrix.reverse!.transpose!
end
