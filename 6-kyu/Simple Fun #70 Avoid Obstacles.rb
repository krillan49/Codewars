#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given an array of integers arr that representing coordinates of obstacles situated on a straight line.
#
# Assume that you are jumping from the point with coordinate 0 to the right. You are allowed only to make jumps of the same length represented by some integer.
#
# Find the minimal length of the jump enough to avoid all the obstacles.
#
# Example
# For arr = [5, 3, 6, 7, 9], the output should be 4.
#
# Check out the image below for better understanding:
# https://codefightsuserpics.s3.amazonaws.com/tasks/avoidObstacles/img/example.png?_tm=1476261772863
#
# Input/Output
# [input] integer array arr
#
# Non-empty array of positive integers.
#
# Constraints: 1 ≤ inputArray[i] ≤ 100.
#
# [output] an integer
#
# The desired length.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def avoid_obstacles(a)
  n = 2
  loop do
    return n if a.all?{|e| e != n && e % n != 0}
    n += 1
  end
end
