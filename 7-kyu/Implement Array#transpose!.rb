#===============================================================================================================
#                                               Description
#===============================================================================================================

# Many Ruby methods come with bang variants (variants that modify the input). For example, Array#uniq! is the bang variant of Array#uniq.

# arr = [1, 2, 1, 5, 6]
# arr.uniq # returns [1, 2, 5, 6] but arr is still [1, 2, 1, 5, 6]
# arr.uniq! # returns [1, 2, 5, 6]
# arr # returns [1, 2, 5, 6] as arr was modified with uniq! and not uniq
# ####Task:

# Your job here is to implement Array#transpose! (which will be the bang variant of Array#transpose). This function returns the array received from transposing the rows and columns in a twodimensional array, and raises an error if the lengths of the subarrays don't match, or if the array is not twodimensional. The function you create should be able to handle sub-arrays with mixed types. For more info on Array#transpose, see the Ruby array docs: https://ruby-doc.org/core-2.3.0/Array.html.

####Examples (see example test cases for more):

# arr = [[1,2,7],[3,5,6]]
# arr.transpose # original method; returns [[1, 3], [2, 5], [7, 6]] but doesn't change arr
# arr.transpose! # your method; returns [[1, 3], [2, 5], [7, 6]] and changes arr to [[1, 3], [2, 5], [7, 6]] too

# arr = [[1,2,7,8],[3,5,6]]
# arr.transpose! # raises an error as subarray lengths don't match

# arr = [1,2,3]
# arr.transpose! # raises an error as input array is not twodimensional
####Cases you won't get:

# [[[1]]].transpose!
# [1,[1,2]].transpose!
# [[1,2],1,[1,7]].transpose!
# [[[1,2,[3,4]]]].transpose!
# In other words, you won't get arrays with both arrays and non-arrays, or more-than-twodimensional arrays.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def transpose!
    self.replace(self.transpose)
  end
end
