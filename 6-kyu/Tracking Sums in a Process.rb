#===============================================================================================================
#                                               Description
#===============================================================================================================

# Observe the process with the array given below and the tracking of the sums of each corresponding array.
#
# [5, 3, 6, 10, 5, 2, 2, 1] (34) ----> [5, 3, 6, 10, 2, 1] ----> (27) ------> [10, 6, 5, 3, 2, 1]  ----> [4, 1, 2, 1, 1] (9) -----> [4, 1, 2] (7)
# The tracked sums are : [34, 27, 9, 7]. We do not register one of the sums. It is not difficult to see why.
#
# We need the function track_sum ( or trackSum ) that receives an array ( or list ) and outputs a tuple ( or array ) with the following results in the order given below:
#
# array with the tracked sums obtained in the process
# final array
# So for our example given above, the result will be:
#
# track_sum([5, 3, 6, 10, 5, 2, 2, 1]) == [[34, 27, 9, 7], [4, 1, 2]]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def track_sum(a)
  b = a.uniq.sort.reverse
  c = b.each_cons(2).map{|a, b| a - b}
  [[a.sum, a.uniq.sum, c.sum, c.uniq.sum], c.uniq]
end
