#===============================================================================================================
#                                               Description
#===============================================================================================================

# In elementary arithmetic a "carry" is a digit that is transferred from one column of digits to another column of more significant digits during a calculation algorithm.
#
# This Kata is about determining the number of carries performed during the addition of multi-digit numbers.
#
# You will receive an input string containing a set of pairs of numbers formatted as follows:
#
# 123 456
# 555 555
# 123 594
# And your output should be a string formatted as follows:
#
# No carry operation
# 3 carry operations
# 1 carry operations
# Some Assumptions
# Assume that numbers can be of any length.
# But both numbers in the pair will be of the same length.
# Although not all the numbers in the set need to be of the same length.
# If a number is shorter, it will be zero-padded.
# The input may contain any arbitrary number of pairs.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve(str)
  str.split("\n").map do |s|
    a, b = s.split
    p = 0; counter = 0
    a.chars.reverse.zip(b.chars.reverse).each do |x, y|
      p = x.to_i + y.to_i + p > 9 ? 1 : 0
      counter += 1 if p == 1
    end
    counter == 0 ? 'No carry operation' : "#{counter} carry operations"
  end.join("\n")
end
