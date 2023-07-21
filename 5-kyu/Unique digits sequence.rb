#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider the following series:
#
# 0,1,2,3,4,5,6,7,8,9,10,22,11,20,13,24...There is nothing special between numbers 0 and 10.
#
# Let's start with the number 10 and derive the sequence. 10 has digits 1 and 0. The next possible number that does not have a 1 or a 0 is 22. All other numbers between 10 and 22 have a 1 or a 0.
#
# From 22, the next number that does not have a 2 is 11. Note that 30 is also a possibility because it is the next higher number that does not have a 2, but we must select the lowest number that fits and is not already in the sequence.
#
# From 11, the next lowest number that does not have a 1 is 20.
#
# From 20, the next lowest number that does not have a 2 or a 0 is 13, then 24 , then 15 and so on.
#
# Once a number appers in the series, it cannot appear again.
#
# You will be given an index number and your task will be return the element at that position. See test cases for more examples.
#
# Note that the test range is n <= 500.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

NUMS=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 22, 11, 20, 13, 24, 15]

def find_num(n)
  return NUMS[n] if NUMS.size > n
  x = 12
  until NUMS.size > n
    x += 1 until !NUMS.include?(x)
    if x.digits.all?{|d| !NUMS[-1].digits.include?(d)}
      NUMS << x
      x = 12
    else
      x += 1
    end
  end
  NUMS[n]
end
