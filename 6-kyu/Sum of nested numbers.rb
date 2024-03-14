#===============================================================================================================
#                                               Description
#===============================================================================================================

# Build a function sumNestedNumbers/sum_nested_numbers that finds the sum of all numbers in a series of nested arrays raised to the power of their respective nesting levels. Numbers in the outer most array should be raised to the power of 1.
#
# For example,
#
# sumNestedNumbers([1, [2], 3, [4, [5]]])
# should return 1 + 2*2 + 3 + 4*4 + 5*5*5 === 149

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sum_nested_numbers(arr)
  sum, n = 0, 1
  loop do
    sum += arr.select{|el| el.class == Integer}.map{|el| el**n}.sum
    n += 1
    arr = arr.reject{|el| el.class == Integer}.flatten(1)
    return sum if arr.empty?
  end
end
