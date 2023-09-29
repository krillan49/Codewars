#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# You are a lonely frog.
#
# You live on an integer array.
#
# The meaning of your life is to jump and jump..
#
# Now, here comes your new task.
#
# You are given an integer array arr and a positive integer n.
#
# You will jump following the rules below:
#
# Your initial position at arr[0]. arr[0] will always be 0.
#
# You will jump according to the number of current position(arr[i])
#
# That is, if the number is a positive integer, let say 3, you will jump forward 3 steps; If the number is a negative integer, let say -3, you will jump backward 3 steps; If the number is 0, you will stay here for a little rest.
# The number of current position(arr[i]) will increase decrease by 1 after each turn (jump or stay).
#
# That is, if the number of current position(arr[i]) is greater than or equal to n, the number will decrease 1; if the number at current position(arr[i]) is less than n, the number will increase 1.
# You will stop jumping when you reach the exit (your position greater than or equal to arr.length). Please tell me, at the moment, how many elements in arr are equal to n?
#
# Note
# 3 <= arr.length <= 1000, 1 <= n <= 9
#
# Frog will never jump backward out of arr.
#
# Example
# For arr = [0,3,0,1,-3], n = 3, the output should be 2.
#
#  Let us jump softly:
#
#  [0,3,0,1,-3]
#   ^--You are here, current number is 0, you stay here.
#      currect number 0 < n, so 0 -> 1
#  [1,3,0,1,-3]
#   ^--You are here, current number is 1, you will jump forward
#      to position 1. current number 1 < n, so 1 -> 2
#  [2,3,0,1,-3]
#     ^--You are here, current number is 3, you will jump forward
#        to position 4. current number 3 >= n, so 3 -> 2
#  [2,2,0,1,-3]
#            ^--You are here, current number is -3, you will jump backward
#               to position 1. current number -3 < n, so -3 -> -2
#  [2,2,0,1,-2]
#     ^--You are here, current number is 2, you will jump forward
#        to position 3. current number 2 < n, so 2 -> 3
#  [2,3,0,1,-2]
#         ^--You are here, current number is 1, you will jump forward
#            to position 3. current number 1 < n, so 1 -> 2
#  [2,3,0,2,-2]
#            ^--You are here, current number is -2, you will jump backward
#               to position 2. current number -2 < n, so -2 -> -1
#  [2,3,0,2,-1]
#       ^--You are here, current number is 0, you stay here.
#          current number 0 < n, so 0 -> 1
#  [2,3,1,2,-1]
#       ^--You are here, current number is 1, you will jump forward
#          to position 3. current number 1 < n, so 1 -> 2
#  [2,3,2,2,-1]
#         ^--You are here, current number is 2, you will jump forward to position 5.
#      current number 2 < n, so 2 -> 3
#  [2,3,2,3,-1] exit
#                ^--You are here, you reach to the exit.
#
#  At the moment, arr[1] and arr[3] are equal to n.
#  So, the output should be 2.
# For arr = [0,-1,-2,-3,-4], n = 4, the output should be 2.
#
#  Let's us jump fast ;-)
#
#  [0,-1,-2,-3,-4]
#   ^
#  [1,-1,-2,-3,-4]
#   ^
#  [2,-1,-2,-3,-4]
#      ^
#  [2, 0,-2,-3,-4]
#   ^
#  [3, 0,-2,-3,-4]
#         ^
#  [3, 0,-1,-3,-4]
#   ^
#  [4, 0,-1,-3,-4]
#            ^
#  [4, 0,-1,-2,-4]
#   ^
#  [3, 0,-1,-2,-4]
#               ^
#  [3, 0,-1,-2,-3]
#   ^
#  [4, 0,-1,-2,-3]
#            ^
#  [4, 0,-1,-1,-3]
#      ^
#  [4, 1,-1,-1,-3]
#      ^
#  [4, 2,-1,-1,-3]
#         ^
#  [4, 2, 0,-1,-3]
#      ^
#  [4, 3, 0,-1,-3]
#            ^
#  [4, 3, 0, 0,-3]
#         ^
#  [4, 3, 1, 0,-3]
#         ^
#  [4, 3, 2, 0,-3]
#            ^
#  [4, 3, 2, 1,-3]
#            ^
#  [4, 3, 2, 2,-3]
#               ^
#  [4, 3, 2, 2,-2]
#      ^
#  [4, 4, 2, 2,-2]
#               ^
#  [4, 4, 2, 2,-1]
#         ^
#  [4, 4, 3, 2,-1]
#               ^
#  [4, 4, 3, 2, 0]
#            ^
#  [4, 4, 3, 3, 0] exit
#                  ^
#  At the moment, arr[0] and arr[1] are equal to n.
#  So, the output should be 2.
# For arr = [0,-1,-2,-3,-4], n = 3, the output should be 0.
#
#  Let's jump fast ;-)
#
#  [0,-1,-2,-3,-4]
#   ^
#  [1,-1,-2,-3,-4]
#   ^
#  [2,-1,-2,-3,-4]
#      ^
#  [2, 0,-2,-3,-4]
#   ^
#  [3, 0,-2,-3,-4]
#         ^
#  [3, 0,-1,-3,-4]
#   ^
#  [2, 0,-1,-3,-4]
#            ^
#  [2, 0,-1,-2,-4]
#   ^
#  [3, 0,-1,-2,-4]
#         ^
#  [3, 0, 0,-2,-4]
#      ^
#  [3, 1, 0,-2,-4]
#      ^
#  [3, 2, 0,-2,-4]
#         ^
#  [3, 2, 1,-2,-4]
#         ^
#  [3, 2, 2,-2,-4]
#            ^
#  [3, 2, 2,-1,-4]
#      ^
#  [3, 3, 2,-1,-4]
#            ^
#  [3, 3, 2, 0,-4]
#         ^
#  [3, 3, 3, 0,-4]
#               ^
#  [3, 3, 3, 0,-3]
#   ^
#  [2, 3, 3, 0,-3]
#            ^
#  [2, 3, 3, 1,-3]
#            ^
#  [2, 3, 3, 2,-3]
#               ^
#  [2, 3, 3, 2,-2]
#      ^
#  [2, 2, 3, 2,-2]
#               ^
#  [2, 2, 3, 2,-1]
#         ^
#  [2, 2, 2, 2,-1] exit
#                   ^
#
#  At the moment, there is no element equal to n.
#  So, the output should be 0.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def jumping(arr, n)
  i = 0
  until i >= arr.size
    j = i
    i += arr[j]
    i = 0 if i < 0
    arr[j] += (arr[j] >= n ? -1 : 1)
  end
  arr.count(n)
end
