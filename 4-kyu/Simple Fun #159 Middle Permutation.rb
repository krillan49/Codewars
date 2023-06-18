#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a string s. Every letter in s appears once.
#
# Consider all strings formed by rearranging the letters in s. After ordering these strings in dictionary order, return the middle term. (If the sequence has a even length n, define its middle term to be the (n/2)th term.)
#
# Example
# For s = "abc", the result should be "bac".
#
#  The permutations in order are: "abc", "acb", "bac", "bca", "cab", "cba" So, The middle term is "bac".
#
# Input/Output
# [input] string s
# unique letters (2 <= length <= 26)
#
# [output] a string
# middle permutation.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def middle_permutation(str)
  n = str.size
  arr = str.chars.sort
  start = (n.odd? ? [n/2, n/2-1] : [n/2-1])
  start.each.with_object([]){|i, res| res << arr.delete_at(i)}.join + arr.reverse.join
end
