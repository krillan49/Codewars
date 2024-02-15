#===============================================================================================================
#                                               Description
#===============================================================================================================

# Extend the Array prototype/class with a function to return all elements of that array, except the ones with the indexes passed in the parameter.
#
# The function should accept either an array or a single integer as parameters, like this:
#
# var array = ['a', 'b', 'c', 'd', 'e'];
# var array2 = array.except([1,3]);
# // array2 should contain ['a', 'c', 'e']
# or
#
# array = ['a', 'b', 'c', 'd', 'e']
# array.except(1) => ['a', 'c', 'd', 'e']
# or
#
# array = [1, 2, 3, 4, 5, 6, 7]
# array.except([0,1]) =< [3,4,5,6,7]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def except(input)
    self.reject.with_index{|c, i| input.class == Integer ? input == i : input.include?(i)}
  end
end
