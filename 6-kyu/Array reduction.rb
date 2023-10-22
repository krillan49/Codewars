#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider a sequence generation that follows the following steps. We will store removed values in variable res. Assume n = 25:
#
# -> [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25] Let's remove the first number => res = [1]. We get..
# -> [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]. Let's remove 2 (so res = [1,2]) and every 2-indexed number. We get..
# -> [3,5,7,9,11,13,15,17,19,21,23,25]. Now remove 3, then every 3-indexed number. res = [1,2,3].
# -> [5,7,11,13,17,19,23,25]. Now remove 5, and every 5-indexed number. res = [1,2,3,5]. We get..
# -> [7,11,13,17,23,25]. Now remove 7 and every 7-indexed. res = [1,2,3,5,7].
# But we know that there are no other 7-indexed elements, so we include all remaining numbers in res. So res = [1,2,3,5,7,11,13,17,23,25] and sum(res) = 107.
#
# Note that when we remove every n-indexed number, we must remember that indices start at 0. So for every 3-indexed number above:
# [3,5,7,9,11,13,15,17,19,21,23], we remove index0=3, index3= 9, index6=15,index9=21, etc.
#
# Note also that if the length of sequence is greater than x, where x is the first element of the sequence, you should continue the remove step: remove x, and every x-indexed number until the length of sequence is shorter than x. In our example above, we stopped at 7 because the the length of the remaining sequence [7,11,13,17,23,25] is shorter than 7.
# You will be given a number n and your task will be to return the sum of the elements in res, where the maximum element in res is <= n.
#
# For example:
#
# Solve(7) = 18, because this is the sum of res = [1,2,3,5,7].
# Solve(25) = 107

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve(n)
  res = [1]
  a = (2..n).to_a
  until a.size <= a[0]
    res << a[0]
    a = a.reject.with_index{|e, i| i % a[0] == 0}
  end
  (res + a).sum
end
