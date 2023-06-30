#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# Consider two following representations of a non-negative integer:
#
# A simple decimal integer, constructed of a non-empty sequence of digits from 0 to 9;
#
# An integer with at least one digit in a base from 2 to 16 (inclusive), enclosed between # characters, and preceded by the base, which can only be a number between 2 and 16 in the first representation. For digits from 10 to 15 characters a, b, ..., f and A, B, ..., F are used.
#
# Additionally, both representations may contain underscore (_) characters; they are used only as separators for improving legibility of numbers and can be ignored while processing a number.
#
# Your task is to determine whether the given string is a valid integer representation.
#
# Note: this is how integer numbers are represented in the programming language Ada.
#
# Example
# For line = "123_456_789", the output should be true;
#
# For line = "16#123abc#", the output should be true;
#
# For line = "10#123abc#", the output should be false;
#
# For line = "10#10#123ABC#", the output should be false;
#
# For line = "10#0#", the output should be true;
#
# For line = "10##", the output should be false.
#
# Input/Output
# [input] string line
# A non-empty string.
#
# [output] a boolean value
# true if line is a valid integer representation, false otherwise.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def ada_number(line)
  line = line.tr('_','').downcase
  return false if !(line =~ /\A(([0-9a-f]{1,})|((2|3|4|5|6|7|8|9|10|11|12|13|14|15|16)\#[0-9a-f]{1,}\#))\z/)
  arr = line.split('#')
  (arr[0].chars.all?{|e| '0123456789'.include?(e)} ? (return true) : (return false)) if arr.size == 1
  arr[1].chars.all?{|e| '0123456789abcdef'[0..arr[0].to_i-1].include?(e)}
end
