#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a string consisting of lowercase English letters, find the largest square number which can be obtained by reordering its characters and replacing them with digits (leading zeros are not allowed) where same characters always map to the same digits and different characters always map to different digits.
#
# If there is no solution, return -1
#
# Examples
# "ab"  -->  81
# "zzz" -->  -1  // There are no 3-digit square numbers with identical digits
# "aba" --> 900  // It can be obtained after reordering the initial string into "baa"
# Input/Output
# [input] string s
#
# Constraints: 2 ≤ s.length < 10.
# [output] an integer

#===============================================================================================================
#                                               Solution
#===============================================================================================================

$sq = (4..99999).map{|e| (e**2).digits.reverse}

def construct_square(s)
  res = s.chars.tally.values.sort
  sq = $sq.select{|e| e.size == s.size && res == e.tally.values.sort}
  sq.empty? ? -1 : sq.last.join.to_i
end
