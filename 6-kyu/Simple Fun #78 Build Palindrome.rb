#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a string str, find the shortest possible string which can be achieved by adding characters to the end of initial string to make it a palindrome.
#
# Example
# For str = "abcdc", the output should be "abcdcba".
#
# Input/Output
# [input] string str
#
# A string consisting of lowercase latin letters.
#
# Constraints: 3 ≤ str.length ≤ 10.
#
# [output] a string

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def build_palindrome(s)
  return s if s == s.reverse
  s.chars.each_with_index do |c, i|
    return s[0...i] + s[i..-1] + s[0...i].reverse if i > 0 && s[i..-1] == s[i..-1].reverse
  end
end
