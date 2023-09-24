#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# Here are some children, each with a certain number of apples. Now we have to do something to make the number of apples of each child are equal.
#
# We need to complete the redistribution step by step. With each step, we can transfer two apples from one child to another (whether or not adjacent does not matter).
#
# Example
#                        7 15 9 5
# step 1: 15-2, 5+2 ---> 7 13 9 7
# step 2: 13-2, 7+2 ---> 9 11 9 7
# step 3: 11-2, 7+2 ---> 9  9 9 9
# The children's apples are equal already. No need more step.
#
# 26 apples can't be divided equally between 4 children.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def min_steps(ap)
  return -1 if ap.sum % ap.size != 0
  mid = ap.sum / ap.size
  return -1 if mid.odd? ? ap.any?(&:even?) : ap.any?(&:odd?)
  ap.map{|n| (n - mid).abs / 2}.sum / 2
end
