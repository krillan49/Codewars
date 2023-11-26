#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a string s that consists of English letters and brackets. It is guaranteed that the brackets in s form a regular bracket sequence.
#
# Your task is to reverse the strings in each pair of matching brackets, starting from the innermost one step by step(remove the brackets at the same time).
#
# Example
# For s = "a(bc)de" the output should be "acbde".
#
# Input/Output
# [input] string s
#
# A string consisting of English letters, punctuation marks, whitespace characters and brackets. It is guaranteed that parenthesis form a regular bracket sequence.
#
# Constraints: 5 ≤ x.length ≤ 100.
#
# [output] a string

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def reverse_parentheses(s)
  while s.include?(')')
    i, j = 0, 0
    s.chars.each_with_index do |c, ind|
      if c == '('
        i = ind
      elsif c == ')'
        j = ind
        break
      end
    end
    s = s[0...i] + s[i+1...j].reverse + s[j+1..-1]
  end
  s
end
