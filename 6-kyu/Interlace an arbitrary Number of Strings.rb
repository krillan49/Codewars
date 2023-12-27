#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a function that takes an arbitrary number of strings and interlaces them (combines them by alternating characters from each string).
#
# For example combineStrings('abc', '123') should return 'a1b2c3'.
#
# If the strings are different lengths the function should interlace them until each string runs out, continuing to add characters from the remaining strings.
#
# For example combineStrings('abcd', '123') should return 'a1b2c3d'.
#
# The function should take any number of arguments and combine them.
#
# For example combineStrings('abc', '123', '£$%') should return 'a1£b2$c3%'.
#
# Note: if only one argument is passed return only that string. If no arguments are passed return an empty string.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def combine_strings(*arr)
  return '' if arr.empty?
  return arr.join if arr.size == 1
  max = arr.max_by(&:size).size
  r = arr.map(&:chars).map{|a| a.size < max ? a + [nil] * (max - a.size) : a}
  r[0].zip(*r[1..-1]).map(&:compact).join
end
