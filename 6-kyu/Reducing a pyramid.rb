#===============================================================================================================
#                                               Description
#===============================================================================================================

# Number pyramid is a recursive structure where each next row is constructed by adding adjacent values of the current row. For example:
#
# Row 1     [1     2     3     4]
# Row 2        [3     5     7]
# Row 3           [8    12]
# Row 4             [20]
# Task
# Given the first row of the number pyramid, find the value stored in its last row.
#
# Performance tests
# Number of tests: 10
# Array size: 10,000

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def paskal_line(n)
  1.upto(n-1).each_with_object([1]){|x, res| res << res[-1] * (n - res.size) / res.size }
end

def reduce_pyramid(base)
  base.zip(paskal_line(base.size)).sum{|a| a.inject(:*)}
end
