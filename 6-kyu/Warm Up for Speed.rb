#===============================================================================================================
#                                               Description
#===============================================================================================================

# The digit root of a number (dr) is the sum of the digits of a number. For example, the integer 749, has a digit root equals to 20.
#
# In effect: 7 + 4 + 9 = 20.
#
# We define here the deeper square double digit root of an integer n, (dsddr), the sum of the squares of every digit of the digit root of n.
#
# The dsddr of 749 will be 4: 2**2 + 0**2 = 4
#
# We define the function f, like:
#
# f(n) = dr(n) + dsddr(n)
# Now we receive two arrays of positive integers,  arr1 , arr2 of different lengths. They have common elements. The task is to output an array, res, with the common elements occurring once and sorted by their corresponding value of f in descending order. If there is a coincidence in the value of f(res[i]), the lowest number goes first.
#
# Example:
#
# arr1 = [5, 56, 28, 35, 12, 27, 64, 99, 18, 31, 14, 6]
# arr2 = [28, 17, 31, 63, 64, 5, 18, 17, 95, 56, 37, 5, 28, 16]
# The common elements of arr1 and arr2 are: [64, 5, 18, 56, 28, 31]
#
# The table for their corresponding value of f is:
#
# n        f(n)
# 64        11
#  5        30
# 18        90
# 56        13
# 28        11
# 31        20
# So the output will be: [18, 5, 31, 56, 28, 64]
#
# You do not have to worry about the inputs, arr1 and arr2, will be always valid arrays and all of their terms, positive integers.
#
# Features of the random tests:
#
# lengths of arrays for the input up to 500.000.
# The values of the integers between 1 and 1.500.000
# Amount of tests almost 150

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sorted_comm_by_digs(arr1, arr2)
  arr = arr1 & arr2
  return arr if arr.size < 2
  arr.sort_by{|n|
    dr = n.digits.sum
    [-(dr + dr.digits.map{|e| e**2}.sum), n]
  }
end
