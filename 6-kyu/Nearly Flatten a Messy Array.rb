#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given an array that of arbitrary depth that needs to be nearly flattened into a 2 dimensional array. The given array's depth is also non-uniform, so some parts may be deeper than others.
#
# All of lowest level arrays (most deeply nested) will contain only integers and none of the higher level arrays will contain anything but other arrays. All arrays given will be at least 2 dimensional. All lowest level arrays will contain at least one element.
#
# Your solution should be an array containing all of the lowest level arrays and only these. The sub-arrays should be ordered by the smallest element within each, so [1,2] should preceed [3,4,5]. Note: integers will not be repeated.
#
# For example:
#
# If you receive [[[1,2,3],[4,5]],[6,7]], your answer should be [[1,2,3],[4,5],[6,7]].

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def near_flatten nested
  res = []
  until nested.empty?
    inds = []
    nested.each.with_index do |a, i|
      if a[0].class == Integer
        res << a
        inds << i
      end
    end
    nested.delete_if{|e| inds.include?(nested.index(e))}
    nested = nested.flatten(1)
  end
  res.sort
end
