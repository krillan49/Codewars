#===============================================================================================================
#                                               Description
#===============================================================================================================

# Does an array contain all the elements of another array?
#
# Sometimes you want to know if all of the elements from one array are present in another. Sometimes your array is not a set and contains duplicate elements that you still want to account for.
#
# Examples:
#
# [1,2,3] contains [2,3]
# [1,2,2,3,3,3] contains [2,3,3]
# [1,2,2,3,3,3] does not contain [2,2,2,3,3] - too many 2's
# And sometimes you need to be strict.
#
# [1.0,2.0,3.0] does not contain [1,2,3] - Floats are not Fixnums
# (But arrays may also be mixed and contain more than one object type.)
#
# Create a method called contains_all? which takes 2 arguments, haystack the array you need to check through and needle the array of elements you are looking for, and returns a boolean true or false.
#
# One more thing, You should make sure your arrays are still intact after the comparison.
#
# This kata is similar to, but stricter than http://www.codewars.com/kata/does-array-x-contain-all-values-within-array-y

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def contains_all?(haystack, needle)
  hf, nf = haystack.select{|e| e.class == Float}, needle.select{|e| e.class == Float}
  hnf, nnf = haystack.select{|e| e.class != Float}, needle.select{|e| e.class != Float}
  nf.uniq.all?{|e| hf.count(e) >= nf.count(e)} && nnf.uniq.all?{|e| hnf.count(e) >= nnf.count(e)}
end
