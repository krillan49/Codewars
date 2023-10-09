#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata we have to calculate products and sums using the values of an array with an arbitrary number of non-zero integers (positive and/or negative). Each number in the array occurs once, i.e. they are all unique.
#
# You need to implement a function eval_prod_sum(arr, num_fact, num_add, max_val) that takes the following four arguments:
#
# A list/array of integers [x1, x2, x3, ... , xn] of arbitrary length n where xi != 0
#
# A positive integer num_fact, which is the number of array elements that combine to form individual products.
#
# For example, given an array [a, b, c, d] and num_fact = 3, the products would be a*b*c, a*b*d, a*c*d, b*c*d
#
# A positive integer num_add, which is the number of previously produced products (see 2.) that combine to form individual sums.
#
# Continuing the previous example, given num_add = 2, the sums would be a*b*c + a*b*d, a*b*c + a*c*d, ..., a*c*d + b*c*d
#
# An integer max_val, against which the previously produced sums will be compared to produce the following results:
#
# smaller, the number of sums that are smaller than max_val
#
# equal, the number of sums that are equal to max_val
#
# larger, the number of sums that are larger than max_val
#
# The output should be a list of dictionaries with the following structure:
#
# [{"Below than max_val" => smaller}, {"Equals to max_val" => equal}, {"Higher than max_val" => larger}]
# Example
# lst = [2, 10, 20, 15]
# num_fact = 3
# num_add = 2
# max_val = 8
# eval_prod_sum(lst, num_fact, num_add, max_val) == [{'Below than 8'=> 0}, {'Equals to 8'=> 0}, {'Higher than 8'=> 6}]
# Factors                Products
#
# (2, 10, 20)            400
#
# (2, 10, 15)            300
#
# (2, 20, 15)            600
#
# (10, 20, 15)           3000
#
#
# Addends                Sums (Final Result)
#
# (300, 400)             700   (larger than 8)
#
# (300, 600)             900   (larger than 8)
#
# (300, 3000)            3300  ( "     "    ")
#
# (400, 600)             1000  ( "     "    ")
#
# (400, 3000)            3400  ( "     "    ")
#
# (600, 3000)            3600  ( "     "    ")
#
# -> 6 sums of which 0 are smaller or equal to 8 and 6 are larger than 8
# Error handling
# The function eval_prod_sum should return an error message under the following conditions:
#
# the given array contains a string or a float, or any of the arguments num_fact, num_add , max_val are strings, floats, negative integers or 0.
#
# Output: "Error. Unexpected entries"
#
# num_fact is larger than the length of the array.
#
# Output: "Error. Number of factors too high"
#
# num_add is larger than the number of product combinations obtainable from the given array with num_fact.
#
# Output: "Error. Number of addens too high"
#
# Examples:
# lst = [2, 10, '20', 15]
# num_fact = 3
# num_add = 2
# max_val = 8
# eval_prod_sum(lst, num_fact, num_add, max_val) == "Error. Unexpected entries"
#
# lst = [2, 10, 20, 15]
# num_fact = 3
# num_add = 2.0
# max_val = '8'
# eval_prod_sum(lst, num_fact, num_add, max_val) == "Error. Unexpected entries"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def eval_prod_sum(arr, fact, add, max)
  return 'Error. Unexpected entries' if (arr + [fact, add, max]).any?{|n| n.class != Integer} || [fact, add, max].any?{|n| n < 1}
  return 'Error. Number of factors too high' if fact > arr.size
  ar = arr.combination(fact).map{|a| a.inject(:*)}
  return 'Error. Number of addens too high' if add > ar.size
  a = ar.combination(add).map(&:sum)
  [
    {"Below than #{max}" => a.count{|n| n < max}},
    {"Equals to #{max}" => a.count{|n| n == max}},
    {"Higher than #{max}" => a.count{|n| n > max}}
  ]
end
