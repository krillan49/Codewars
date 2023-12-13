#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata, your task is to identify the pattern underlying a sequence of numbers. For example, if the sequence is [1, 2, 3, 4, 5], then the pattern is [1], since each number in the sequence is equal to the number preceding it, plus 1. See the test cases for more examples.
#
# A few more rules :
#
# pattern may contain negative numbers.
# sequence will always be made of a whole number of repetitions of the pattern.
# Your answer must correspond to the shortest form of the pattern, e.g. if the pattern is [1], then [1, 1, 1, 1] will not be considered a correct answer.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_pattern(arr)
  a = arr.each_cons(2).map{|a, b| b - a}.to_a
  res = []
  a.each do |n|
    res << n
    break if (res * (a.size / res.size))[0..a.size] == a
  end
  res
end
