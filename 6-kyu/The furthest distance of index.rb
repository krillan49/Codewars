#===============================================================================================================
#                                               Description
#===============================================================================================================

# When no more interesting kata can be resolved, I just choose to create the new kata, to solve their own, to enjoy the process --myjinxin2015 said
#
# Description:
# Give you an array arr that contains some numbers(arr.length>=2), and give you a positive integer k. Find such two numbers m,n: m and n at least a difference of k, and their index is the most distant.
#
# Returns their distance of index. If no such number found, return -1.
#
# Some Examples
# furthest_distance([8,7,1,9],5) === 2
#
# The difference of 8 and 1, 1 and 9 is more than 5;
# The index distance of (8,1) is 2;
# The index distance of (1,9) is 1;
# So 2 is the furthest distance of index.
#
# furthest_distance([8,7,1,9],100) === -1
# furthest_distance([1,2,3,4],1) === 3 (1 and 4)
# furthest_distance([3,4,1,2],2) === 2 (3 and 1 or 4 and 2)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def furthest_distance(arr, k)
  arr.map.with_index{|e, i| [e, i]}.combination(2).select{|a, b| (a[0] - b[0]).abs >= k}.map{|a, b| (a[1] - b[1]).abs}.max || -1
end
