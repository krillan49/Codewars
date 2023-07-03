#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a certain number, how many multiples of three could you obtain with its digits?
#
# Suposse that you have the number 362. The numbers that can be generated from it are:
#
# 362 ----> 3, 6, 2, 36, 63, 62, 26, 32, 23, 236, 263, 326, 362, 623, 632
# But only:
#
# 3, 6, 36, 63 are multiple of three.
#
# We need a function that can receive a number ann may output in the following order:
#
# the amount of multiples
#
# the maximum multiple
#
# Let's see a case the number has a the digit 0 and repeated digits:
#
# 6063 ----> 0, 3, 6, 30, 36, 60, 63, 66, 306, 360, 366, 603, 606, 630, 636, 660, 663, 3066, 3606, 3660, 6036, 6063, 6306, 6360, 6603, 6630
# In this case the multiples of three will be all except 0
#
# 6063 ----> 3, 6, 30, 36, 60, 63, 66, 306, 360, 366, 603, 606, 630, 636, 660, 663, 3066, 3606, 3660, 6036, 6063, 6306, 6360, 6603, 6630
# The cases above for the function:
#
# find_mult_3(362) == [4, 63]
#
# find_mult_3(6063) == [25, 6630]
# In Javascript findMult_3(). The function will receive only positive integers (num > 0), and you don't have to worry for validating the entries.
#
# Features of the random tests:
#
# Number of test = 100
# 1000 ≤ num ≤ 100000000

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_mult_3(num)
  arr = (1..num.to_s.size).map{|n| num.digits.combination(n).select{|a| a.sum % 3 == 0}}.flatten(1)
  max_size = arr.max_by(&:size).size
  max = arr.select{|a| a.size == max_size}.map{|a| a.sort.reverse.join.to_i}.max

  arr = arr.reject{|a| a.all?(&:zero?)}.map(&:sort).uniq # delete same
  nums = arr.map{|a| a.join.to_i} # delete same with 0(delete [3,6] if have [0,3,6])
  arr.reject!.with_index{|a, i| i != arr.size-1 && nums[i+1..-1].include?(a.join.to_i)}
  res = arr.map{|a| (1..a.size).inject(:*) / a.uniq.map{|n| a.count(n)}.map{|n| (1..n).inject(:*)}.inject(:*)}.sum

  [res, max]
end
