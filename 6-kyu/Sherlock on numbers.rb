#===============================================================================================================
#                                               Description
#===============================================================================================================

# Sherlock has to find suspect on his latest case. He will use your method, dear Watson. The suspect in this case is a number which is most unique in given set, e.g.:
#
# has least (minimum) occurences in set
# and no other number has the same occurences count
# Write method which helps Sherlock to find suspect from given set of numbers. If no suspect is found the method should return nil.
#
# find_suspect(1, 2, 3, 4, 2, 2, 1, 4, 4) # => 3
# find_suspect(1, 1, 2, 2) # => nil
# find_suspect(1, 1, 2, 2, 2) # => 1
# find_suspect(1, 2, 3, 4, 4, 3) # => nil

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_suspect(*num)
  arr = num.uniq
           .map{|n| [n, num.count(n)]}
           .sort_by{|a| a[1]}
           .slice_when{|a, b| a[1] != b[1]}
           .select{|a| a.size == 1}
           .flatten(1)
  return nil if arr == []
  res = arr.min_by{|a| a[1]}
  res[1] == num.uniq.map{|n| num.count(n)}.min ? res[0] : nil
end
